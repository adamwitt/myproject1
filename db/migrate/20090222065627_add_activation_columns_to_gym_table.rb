class AddActivationColumnsToGymTable < ActiveRecord::Migration
  def self.up
    add_column :gyms, :activated, :boolean, :default => false
    add_column :gyms, :activation_code, :string
  end

  def self.down
    remove_column :gyms, :activated
    remove_column :gyms, :activation_code
  end
end
