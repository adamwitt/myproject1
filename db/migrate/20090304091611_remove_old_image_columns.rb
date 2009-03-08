class RemoveOldImageColumns < ActiveRecord::Migration
  def self.up
    remove_column :fighters, :image_filename
    remove_column :fighters, :thumb_filename
    
  end

  def self.down
  end
end
