class RemovePrefRulesFromFighter < ActiveRecord::Migration
  def self.up
    remove_column :fighters, :preferred_rules
  end

  def self.down
    add_column :fighters, :preferred_rules, :integer, :default => 1
  end
end
