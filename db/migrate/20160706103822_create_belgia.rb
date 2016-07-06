class CreateBelgia < ActiveRecord::Migration
  def change
    create_table :belgia do |t|
      t.string :ville
      t.string :codepostal

      t.timestamps null: false
    end
  end
end
