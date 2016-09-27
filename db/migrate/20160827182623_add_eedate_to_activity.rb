class AddEedateToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :eedate, :datetime
  end
end
