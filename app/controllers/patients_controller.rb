class PatientsController < ApplicationController
  before_action :authenticate_user

  def create
    patient = patient_params
    # extract the client id from the JSON to a Client object
    patient['client'] = Client.find_by(id: patient['client'])
    @patient = Patient.new(patient)

    if @patient.save
      render status: 201, json: { success: true }
    else
      render status: :error, json: { success: false, errors: @patient.errors.full_messages }
    end
  end

  def show
    @patient = Patient.find_by(id: params[:id])
  #  @generalAlerts= Note.where(, is_alert: true)

  #  @medical_record = MedicalRecord.find_by(id: params[:id])
  #  @generalAlerts= Note.where(medical_record_id: params[:id], is_alert: true)
  #  @medications = Medication.where("medical_record_id = ?", params[:id])
  #  @medicationAlerts = [] 

  #  @medications.each do |med|
  #    # Must implement a way to expire medication alerts
  #    if med.reminder.to_i <= (Date.today + 3.months).to_time.to_i and med.reminder != nil and med.reminder != 0
  #      @medicationAlerts.append(med)
  #    end
  #  end
    if @patient
      # Return client with a patient, to match UI
      # UI always shows the client info with a patient info
      
      client = Client.find(@patient.client_id)
      @patient = @patient.attributes
      @patient['client'] = client.attributes
      
      render json: { success: true, patient: @patient}
    else
      render status: 404, json: {success: false, error: 'Patient not found'}
    end
    
    
  end

  def index
    patients = Patient.all
    patient_list = filter_patient_keys patients
    
    render json: { success: true, patients: patient_list }
  end

  private

  def filter_patient_keys(patients)
    patients.map do |patient|
      { id: patient.id, first_name: patient.first_name, last_name: patient.last_name }
    end
  end
  
  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :gender, :client, :species,
                                    :reproductive_status, :tattoo, :microchip,
                                    :age, :colour)
  end
end
