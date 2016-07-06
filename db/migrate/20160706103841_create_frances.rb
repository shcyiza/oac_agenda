class CreateFrances < ActiveRecord::Migration
  def change
    create_table :frances do |t|
      t.string :ville
      t.string :codepostal

      t.timestamps null: false
    end
  end
end
