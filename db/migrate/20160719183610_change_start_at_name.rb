class ChangeStartAtName < ActiveRecord::Migration
  def change
    rename_column :events, :start_at, :esdate
    rename_column :events, :end_at, :eedate
  end
end
