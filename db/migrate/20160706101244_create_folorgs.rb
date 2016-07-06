class CreateFolorgs < ActiveRecord::Migration
  def change
    create_table :folorgs do |t|
      t.integer :user_id
      t.integer :orgn_id

      t.timestamps null: false
    end
  end
end
