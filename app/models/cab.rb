class Cab < ApplicationRecord
	belongs_to :driver
	has_many :cab_users
	has_many :users, through: :cab_users
end
