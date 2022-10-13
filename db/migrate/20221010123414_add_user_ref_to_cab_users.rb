class AddUserRefToCabUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :cab_users, :user, null: false, foreign_key: true
  end
end
