class CreateResas < ActiveRecord::Migration
  def change
    create_table :resas do |t|
      t.integer :user_id
      t.integer :event_id
      t.string :resanr
      t.boolean :resa_claimed

      t.timestamps null: false
    end
  end
end
