class AddDriverNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :is_driver, :boolean, default: false
  end
end
