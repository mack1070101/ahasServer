# == Schema Information
#
# Table name: medical_records
#
#  id                     :integer          not null, primary key
#  temperature            :float
#  exam_notes             :text
#  medications            :text
#  eyes                   :string
#  oral                   :string
#  ears                   :string
#  glands                 :string
#  skin                   :string
#  abdomen                :string
#  urogenital             :string
#  nervousSystem          :string
#  musculoskeletal        :string
#  cardiovascular         :string
#  heart_rate             :integer
#  respiratory            :string
#  respiratory_rate       :integer
#  attitudeBAR            :boolean
#  attitudeQAR            :boolean
#  attitudeDepressed      :boolean
#  eyesN                  :boolean
#  eyesA                  :boolean
#  mmN                    :boolean
#  mmPale                 :boolean
#  mmJaundiced            :boolean
#  mmTacky                :boolean
#  earsN                  :boolean
#  earsA                  :boolean
#  earsEarMites           :boolean
#  earsAU                 :boolean
#  earsAD                 :boolean
#  earsAS                 :boolean
#  glandsN                :boolean
#  glandsA                :boolean
#  skinN                  :boolean
#  skinA                  :boolean
#  abdomenN               :boolean
#  abdomenA               :boolean
#  urogenitalN            :boolean
#  urogenitalA            :boolean
#  nervousSystemN         :boolean
#  nervousSystemA         :boolean
#  musculoskeletalN       :boolean
#  musculoskeletalA       :boolean
#  cardiovascularN        :boolean
#  cardiovascularA        :boolean
#  respiratoryN           :boolean
#  respiratoryA           :boolean
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  patient_id             :integer          not null
#  summary                :string
#  signature              :text
#  date                   :integer
#  follow_up_instructions :text
#  mcsN                   :boolean
#  mcsMild                :boolean
#  mcsMod                 :boolean
#  mcsSevere              :boolean
#  weight                 :integer
#  weightUnit             :string
#  bcsVal                 :integer
#  oralA                  :boolean
#  oralN                  :boolean
#

class MedicalRecord < ApplicationRecord
  belongs_to :patient

  has_many   :notes
  has_many   :medications
  validates :patient_id, presence: true, allow_bank: false


  validates :temperature, presence: true, allow_blank: true, numericality: true

  validates :signature, presence: true, allow_blank: true

  validates :date, presence: true, allow_blank: true, numericality: true

  validates :exam_notes, presence: true, allow_blank: true

  validates :medications, presence: true, allow_blank: true

  validates :eyes, presence: true, allow_blank: true

  validates :oral, presence: true, allow_blank: true

  validates :ears, presence: true, allow_blank: true

  validates :glands, presence: true, allow_blank: true

  validates :skin, presence: true, allow_blank: true

  validates :abdomen, presence: true, allow_blank: true

  validates :urogenital, presence: true, allow_blank: true

  validates :nervousSystem, presence: true, allow_blank: true

  validates :musculoskeletal, presence: true, allow_blank: true

  validates :cardiovascular, presence: true, allow_blank: true

  validates :heart_rate, presence: true, allow_blank: true, numericality: true

  validates :respiratory, presence: true, allow_blank: true

  validates :respiratory_rate, presence: true, allow_blank: true, numericality: true

  validates :attitudeBAR, presence: true, allow_blank: true, inclusion: { in: [true, false] }

  validates :attitudeQAR, presence: true, allow_blank: true, inclusion: { in: [true, false] }

  validates :attitudeDepressed, presence: true, allow_blank: true, inclusion: { in: [true, false] }

  validates :eyesN, presence: true, allow_blank: true, inclusion: { in: [true, false] }

  validates :eyesA, presence: true, allow_blank: true, inclusion: { in: [true, false] }

  validates :mmN, presence: true, allow_blank: true, inclusion: { in: [true, false] }

  validates :mmPale, presence: true, allow_blank: true, inclusion: { in: [true, false] }

  validates :mmJaundiced, presence: true, allow_blank: true, inclusion: { in: [true, false] }

  validates :mmTacky, presence: true, allow_blank: true, inclusion: { in: [true, false] }

  validates :earsN, presence: true, allow_blank: true, inclusion: { in: [true, false] }

  validates :earsA, presence: true, allow_blank: true, inclusion: { in: [true, false] }

  validates :earsEarMites, presence: true, allow_blank: true, inclusion: { in: [true, false] }

  validates :earsAU, presence: true, allow_blank: true, inclusion: { in: [true, false]}

  validates :earsAD, presence: true, allow_blank: true, inclusion: { in: [true, false] }

  validates :earsAS, presence: true, allow_blank: true, inclusion: { in: [true, false] }

  validates :glandsN, presence: true, allow_blank: true, inclusion: { in: [true, false] }

  validates :glandsA, presence: true, allow_blank: true, inclusion: { in: [true, false] }

  validates :skinN, presence: true, allow_blank: true, inclusion: { in: [true, false] }

  validates :skinA, presence: true, allow_blank: true, inclusion: { in: [true, false] }

  validates :abdomenN, presence: true, allow_blank: true, inclusion: { in: [true, false] }

  validates :abdomenA, presence: true, allow_blank: true, inclusion: { in: [true, false] }

  validates :urogenitalN, presence: true, allow_blank: true, inclusion: { in: [true, false] }

  validates :urogenitalA, presence: true, allow_blank: true, inclusion: { in: [true, false] }

  validates :nervousSystemN, presence: true, allow_blank: true, inclusion: { in: [true, false] }

  validates :nervousSystemA, presence: true, allow_blank: true, inclusion: { in: [true, false] }

  validates :musculoskeletalN, presence: true, allow_blank: true, inclusion: { in: [true, false] }

  validates :musculoskeletalA, presence: true, allow_blank: true, inclusion: { in: [true, false] }

  validates :cardiovascularN, presence: true, allow_blank: true, inclusion: { in: [true, false] }

  validates :cardiovascularA, presence: true, allow_blank: true, inclusion: { in: [true, false] }

  validates :respiratoryN, presence: true, allow_blank: true, inclusion: { in: [true, false] }

  validates :respiratoryA, presence: true, allow_blank: true, inclusion: { in: [true, false] }

  validates :mcsMod, presence: true, allow_blank: true, inclusion: { in: [true, false] }

  validates :mcsN, presence: true, allow_blank: true, inclusion: { in: [true, false] }

  validates :mcsMild, presence: true, allow_blank: true, inclusion: { in: [true, false] }

  validates :mcsSevere, presence: true, allow_blank: true, inclusion: { in: [true, false] }

  validates :weight, presence: true, allow_blank: true

  validates :weightUnit, presence: true, allow_blank: true

  validates :bcsVal, presence: true, allow_blank: true
end
