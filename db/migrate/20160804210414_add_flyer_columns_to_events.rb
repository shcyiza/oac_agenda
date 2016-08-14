class AddFlyerColumnsToEvents < ActiveRecord::Migration

  def up
    add_attachment :events, :flyer
  end

  def down
    remove_attachment :events, :flyer
  end

end
