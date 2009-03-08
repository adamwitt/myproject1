class RemovePostCode < ActiveRecord::Migration
  def self.up
    remove_column :gyms, :postcode
  end

  def self.down
    add_column :gyms, :postcode,:string,:default => ""
  end
end
