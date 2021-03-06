require 'test_helper'

class NotesTest < ActionDispatch::IntegrationTest
  def setup
    @good = notes(:one)
    @good.save
    @medical_record = medical_records(:one)
    @note = {
      medical_record_id: @medical_record.id,
      body: 'hello',
      is_alert: true,
      initials: 'jk rowling'
    }
  end

  test 'posting a valid note' do
    post "/api/patients/#{@medical_record.patient_id}/medical_records/#{@medical_record.id}/notes", headers: authenticated_header, params: { note: @note }
    
    assert_response 201
    assert JSON.parse(response.body)['success']
  end

   test 'posting a valid note to a non existent route' do
    post "/api/patients/#{@medical_record.patient_id}/medical_records/27/notes", headers: authenticated_header, params: { note: @note }
    
    assert_response 404
    assert JSON.parse(response.body)['error']
  end

  test 'posting a invalid note' do
    @note['body'] = ''
    assert_no_difference 'Note.count' do
      post "/api/patients/#{@medical_record.patient_id}/medical_records/#{@medical_record.id}/notes", headers: authenticated_header, params: { note: @note }
      
      assert_response :error
      assert_not JSON.parse(response.body)['success']
    end
  end

  test 'asking for a valid note' do
    get "/api/patients/#{@medical_record.patient_id}/medical_records/#{@medical_record.id}/notes/#{@good.id}", headers: authenticated_header

    assert_response :success
    assert JSON.parse(response.body)['note']['id'] == @good.id
  end

  test 'asking for an invalid note' do
    @bad_id = Note.last.id + 1
    get "/api/patients/#{@medical_record.patient_id}/medical_records/#{@medical_record.id}/notes/#{@bad_id}", headers: authenticated_header

    assert_response 404
    assert !JSON.parse(response.body)['error'].nil?
  end

  test 'get index of notes for medical records' do
    get "/api/patients/#{@medical_record.patient_id}/medical_records/#{@medical_record.id}/notes", headers: authenticated_header

    assert_response 200
    assert JSON.parse(response.body)['notes'].length > 0
  end

  test 'get index of notes for medical record that does not exist' do
    get "/api/patients/#{@medical_record.patient_id}/medical_records/27/notes", headers: authenticated_header

    assert_response 404
    assert JSON.parse(response.body)['error']
  end

  test 'should get a 404 if a patient - medical_record relation does not exist' do
    get "/api/patients/404/medical_records/27/notes", headers: authenticated_header

    assert_response 404
    assert JSON.parse(response.body)['error']
  end
end
