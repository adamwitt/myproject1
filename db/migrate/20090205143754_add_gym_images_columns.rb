class AddGymImagesColumns < ActiveRecord::Migration
  def self.up
    add_column :gyms, :logo_filename, :string, :null => false
    add_column :gyms, :gym_pic_filename, :string,:null => false
  end

  def self.down
    remove_column :gyms, :logo_filename
    remove_column :gyms, :gym_pic_filename
  end
end
