class AddLastNavigationAtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_seen_at, :datetime, :default => Time.now
  end
end
