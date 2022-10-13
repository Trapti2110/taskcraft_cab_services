class CreateCabs < ActiveRecord::Migration[6.0]
  def change
    create_table :cabs do |t|
      t.integer :cab_number
      
      t.timestamps
    end
  end
end
