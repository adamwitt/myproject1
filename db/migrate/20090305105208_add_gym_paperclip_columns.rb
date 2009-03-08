class AddGymPaperclipColumns < ActiveRecord::Migration
  def self.up
    add_column :gyms, :photo_file_name, :string # Original filename
    add_column :gyms, :photo_content_type, :string # Mime type
    add_column :gyms, :photo_file_size, :integer # File size in bytes
    remove_column :gyms,  :logo_filename
    remove_column :gyms,  :gym_pic_filename
  end

  def self.down
    remove_column :gyms, :photo_file_name
    remove_column :gyms, :photo_content_type
    remove_column :gyms, :photo_file_size
  end
end
