class AddFightersRulesAssociationTable < ActiveRecord::Migration
  def self.up
    create_table :fighters_rules do |t|
      t.column :rule_id, :integer, :null => false
      t.column :fighter_id, :integer, :null => false
    end
  end

  def self.down
    drop_table :fighters_rules
  end
end
