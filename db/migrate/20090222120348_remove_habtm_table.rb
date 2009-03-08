class RemoveHabtmTable < ActiveRecord::Migration
  def self.up
    drop_table :fighters_gyms    
  end

  def self.down
  end
end
