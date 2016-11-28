class AddLastSeenAtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_click_at, :datetime
  end
end
