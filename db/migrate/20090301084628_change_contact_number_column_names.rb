class ChangeContactNumberColumnNames < ActiveRecord::Migration
  def self.up
    rename_column :gyms, :mobile, :primary_contact_number
    rename_column :gyms, :phone, :secondary_contact_number
  end

  def self.down
    rename_column :gyms, :primary_contact_number, :mobile
    rename_column :gyms, :secondary_contact_number, :phone
  end
end
