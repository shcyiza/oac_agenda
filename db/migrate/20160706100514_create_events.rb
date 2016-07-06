class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :orgn_id
      t.string :enom
      t.text :edesc
      t.datetime :edate
      t.decimal :pafpre
      t.decimal :pafplace
      t.string :pays
      t.string :ville
      t.string :codepostal
      t.string :rue
      t.string :nrrue

      t.timestamps null: false
    end
  end
end
