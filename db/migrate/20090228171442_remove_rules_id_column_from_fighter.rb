class RemoveRulesIdColumnFromFighter < ActiveRecord::Migration
  def self.up
    remove_column :fighters, :rules_id
  end

  def self.down
    add_column :fighters, :rules_id, :integer, :default => 1
  end
end
