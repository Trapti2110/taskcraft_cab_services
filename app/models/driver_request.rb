class DriverRequest < ApplicationRecord
  
  has_one_attached :driving_license
  has_one_attached :registration_certificate
  has_one_attached :insurence_of_driver

  enum status: [:pending, :approved]
end

