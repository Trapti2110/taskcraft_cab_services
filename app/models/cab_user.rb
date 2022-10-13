class CabUser < ApplicationRecord
	belongs_to :cab
	belongs_to :user
end
