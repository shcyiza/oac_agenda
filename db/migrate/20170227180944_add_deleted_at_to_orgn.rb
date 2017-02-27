class AddDeletedAtToOrgn < ActiveRecord::Migration
  def change
    add_column :orgns, :deleted_at, :datetime
    add_index :orgns, :deleted_at
  end
end
