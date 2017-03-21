class MedicationsController < ApplicationController
  before_action :authenticate_user

  def create
    # @medications = params.require[:medications]
    # puts @medications.to_json
    # if @medication.save
    #   render status: 201, json: { success: true }
    # else
    #   render status: :error, json: { success: false, errors: @medication.errors.full_messages }
    # end

    # See medical_record_controller
  end
  
  def show
    medication = Medication.find_by(id: params[:id])
    if medication
      render json: { success: true, medication: medication }
    else
      render status: 404, json: { success: false, error: 'Medication not found' }
    end
  end

  def index
    medications = Patient.find_by(id: params[:patient_id]).medications
    if medications
      render json: { success: true, medications: filter_type(medications) }
    else
      render status: 404, json: { success: false, error: 'Medication not found' }
    end
  end

  def filter
    medications
  end

  private

  
  def filter_type(medications)
    type = params[:med_filter]
    if !type.nil?
      medications.select do |medication|
        type == medication.med_type
      end
    else
      medications
    end
  end

  def medication_params
    params.require(:medications).permit(:name, :reminder, :med_type)
  end
end
