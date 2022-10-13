class AddDriverRefToCabs < ActiveRecord::Migration[6.0]
  def change
    add_reference :cabs, :driver, null: false, foreign_key: true
  end
end
