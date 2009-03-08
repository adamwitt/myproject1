class AddressLines < ActiveRecord::Migration
  def self.up
    remove_column :gyms, :address
    add_column :gyms, :address_line_1, :string, :null => false
    add_column :gyms, :address_line_2, :string, :null => true
    add_column :gyms, :city, :string, :null => false
  end

  def self.down
    remove_column :gyms, :address_line_1
    remove_column :gyms, :address_line_2
    remove_column :gyms, :city
  end
end
