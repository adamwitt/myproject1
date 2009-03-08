class AddTableForGymAndFighterAssociation < ActiveRecord::Migration
  def self.up
    create_table :fighters_gyms do |t|
      t.column :gym_id, :integer, :null => false
      t.column :fighter_id, :integer, :null => false
    end
  end

  def self.down
    drop_table :fighters_gyms
  end
end
