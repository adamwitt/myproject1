class RenameLastUpdated < ActiveRecord::Migration
  def self.up
    rename_column :gyms, :last_updated, :updated_on
  end

  def self.down
    rename_column :gyms, :updated_on, :last_updated
  end
end
