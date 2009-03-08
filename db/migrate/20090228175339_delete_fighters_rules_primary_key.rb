class DeleteFightersRulesPrimaryKey < ActiveRecord::Migration
  def self.up
    remove_column :fighters_rules, :id
  end

  def self.down
  end
end
