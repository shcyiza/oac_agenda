class CreateEventsTags < ActiveRecord::Migration
  def change
    create_table :events_tags, :id => false do |t|
      t.references :event, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true
    end
  end
end
