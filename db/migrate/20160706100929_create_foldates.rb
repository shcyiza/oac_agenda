class CreateFoldates < ActiveRecord::Migration
  def change
    create_table :foldates do |t|
      t.integer :user_id
      t.date :datefolwd

      t.timestamps null: false
    end
  end
end
