class RemoveTypeColumnFromRulesTable < ActiveRecord::Migration
  def self.up
    remove_column :rules, :type
    add_column :rules, :discipline, :string
  end

  def self.down
    add_column :rules, :type, :string
    remove_column :rules, :discipline, :string
  end
end
