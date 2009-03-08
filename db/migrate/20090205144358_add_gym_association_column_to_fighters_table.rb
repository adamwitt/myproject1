class AddGymAssociationColumnToFightersTable < ActiveRecord::Migration
  def self.up
    add_column :fighters, :gym_id, :integer
  end

  def self.down
    remove_column :fighters, :gym_id
  end
end
