class ChangeNameEvent < ActiveRecord::Migration
  def change
    rename_column :events, :name, :enom
    rename_column :events, :edescr, :edesc
  end
end
