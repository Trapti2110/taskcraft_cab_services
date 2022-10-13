class AddColumnToCabs < ActiveRecord::Migration[6.0]
  def change
    add_column :cabs, :cab_route, :string, default: false
    add_column :cabs, :cab_name, :string, default: false

  end
end
