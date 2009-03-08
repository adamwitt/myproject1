class FixRules < ActiveRecord::Migration
  def self.up
    remove_column :rules, :fighter_id
  end

  def self.down
    add_column :rules, :fighter_id, :integer
  end
end
