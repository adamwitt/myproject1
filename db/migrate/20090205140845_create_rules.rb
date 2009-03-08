class CreateRules < ActiveRecord::Migration
  def self.up
    create_table :rules do |t|
      
      # Public Details
      t.column :type, :string, :null => false
      
      # Association Column
      t.column :fighter_id, :integer, :null => false
    end
  end

  def self.down
    drop_table :rules
  end
end
