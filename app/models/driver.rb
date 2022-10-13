class Driver < ApplicationRecord
	has_many :cabs
	belongs_to :user
end