class FixGymTableColumns < ActiveRecord::Migration
  def self.up
    change_column :gyms, :phone, :string, :default => "Not available"
    change_column :gyms, :website, :string, :default => "Not available"
    change_column :gyms, :address_line_2, :string, :default => ""
    change_column :gyms, :gym_pic_filename, :string, :default => "default_gym_pic.gif"
    change_column :gyms, :logo_filename, :string, :default => "default_gym_logo.gif"
  end

  def self.down
  end
end
