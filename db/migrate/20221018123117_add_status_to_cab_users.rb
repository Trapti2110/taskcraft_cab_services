class AddStatusToCabUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :cab_users, :status, :integer, default: 0
  end
end
