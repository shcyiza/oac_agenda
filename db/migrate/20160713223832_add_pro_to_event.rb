class AddProToEvent < ActiveRecord::Migration
  def change
    add_column :events, :eedate, :datetime
    rename_column :events, :edate, :esdate

  end
end
