class ChangeFighterImageColumnNullness < ActiveRecord::Migration
  def self.up
    change_column :fighters, :thumb_filename, :string, :default => "default_thumb_M.gif"
    change_column :fighters, :image_filename, :string, :default => "default_profile_M.gif"
  end

  def self.down
  end
end
