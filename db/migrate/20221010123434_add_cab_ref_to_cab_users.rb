class AddCabRefToCabUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :cab_users, :cab, null: false, foreign_key: true
  end
end
