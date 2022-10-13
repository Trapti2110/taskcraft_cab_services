class CreateCabUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :cab_users do |t|
      t.string :name
      t.timestamps
    end
  end
end
