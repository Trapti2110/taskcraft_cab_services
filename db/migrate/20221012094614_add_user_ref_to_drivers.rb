class AddUserRefToDrivers < ActiveRecord::Migration[6.0]
  def change
    add_reference :drivers, :user, null: true, foreign_key: true
  end
end
