class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.belong_to :user
      t.string :action
      t.belong_to :trackable
      t.string :trackable_type

      t.timestamps null: false
    end
  end
end
