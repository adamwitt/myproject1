class FixFighterEmailDefault < ActiveRecord::Migration
  def self.up
    change_column :fighters, :email, :string, :default => ""
  end

  def self.down
  end
end
