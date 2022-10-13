class AddStatusToDriverRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :driver_requests, :status, :integer, default: 0
  end
end
