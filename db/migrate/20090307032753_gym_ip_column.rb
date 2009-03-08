class GymIpColumn < ActiveRecord::Migration
  def self.up
    add_column :gyms, :ip, :string, :default => ""
  end

  def self.down
    remove_column :gyms, :ip
  end
end
