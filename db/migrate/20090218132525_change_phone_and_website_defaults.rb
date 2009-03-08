class ChangePhoneAndWebsiteDefaults < ActiveRecord::Migration
  def self.up
    change_column :gyms, :phone, :string, :default => ""
    change_column :gyms, :website, :string, :default => ""
  end

  def self.down
  end
end
