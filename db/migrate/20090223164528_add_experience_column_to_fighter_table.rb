class AddExperienceColumnToFighterTable < ActiveRecord::Migration
  def self.up
    add_column :fighters, :experience, :string, :default => "5 or less fights"
  end

  def self.down
    remove_column :fighters, :experience
  end
end
