class CreateDriverRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :driver_requests do |t|
      t.string :name
      t.string :email    
      t.timestamps
    end
  end

end
