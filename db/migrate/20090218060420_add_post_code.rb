class AddPostCode < ActiveRecord::Migration
  def self.up
    add_column :gyms, :postcode, :string, :null => false
  end

  def self.down
    remove_column :gyms, :postcode
  end
end
