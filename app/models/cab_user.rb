class CabUser < ApplicationRecord
	belongs_to :cab
	belongs_to :user

	enum status: [:pending, :approved]
end
