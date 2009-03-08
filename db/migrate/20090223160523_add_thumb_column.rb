class AddThumbColumn < ActiveRecord::Migration
  def self.up
    add_column :fighters, :thumb_filename, :string, :null => false, :default => "default_thumb_M.gif"
  end

  def self.down
    remove_column :fighters, :thumb_filename
  end
end
