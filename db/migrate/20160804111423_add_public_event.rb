class AddPublicEvent < ActiveRecord::Migration
  def change
    change_column :events, :public, :boolean, :default => false
  end
end
