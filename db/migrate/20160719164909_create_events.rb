class CreateEvents < ActiveRecord::Migration

  def self.up
    create_table :events do |t|
      t.integer :orgn_id
      t.string :name
      t.text :edescr
      t.datetime :start_at
      t.datetime :end_at
      t.decimal :pafpre
      t.decimal :pafplace
      t.string :pays
      t.string :ville
      t.string :codepostal
      t.string :rue
      t.string :nrrue
      t.timestamps
    end
  end
end
