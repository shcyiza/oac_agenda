class CreateOrgns < ActiveRecord::Migration
  def change
    create_table :orgns do |t|
      t.integer :user_id
      t.string :oname
      t.text :odesc
      t.string :oemail
      t.string :onum

      t.timestamps null: false
    end
  end
end
