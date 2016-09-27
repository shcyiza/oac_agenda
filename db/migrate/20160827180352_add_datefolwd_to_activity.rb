class AddDatefolwdToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :datefolwd, :date
    add_column :activities, :esdate, :datetime
  end
end
