class AddColumnToCabs < ActiveRecord::Migration[6.0]
  def change
    add_column :cabs, :cab_route, :string
    add_column :cabs, :cab_name, :string

  end
end
