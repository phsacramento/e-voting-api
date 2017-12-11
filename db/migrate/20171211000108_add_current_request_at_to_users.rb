class AddCurrentRequestAtToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :current_request_at, :datetime
  end
end
