class CreateFighters < ActiveRecord::Migration
  def self.up
    create_table :fighters do |t|

      # Association Columns
      t.column :rules_id, :integer, :null => false

      # Public Details
      t.column :first_name, :string, :null => false
      t.column :last_name, :string, :null => false
      t.column :ring_name, :string, :null => false
      t.column :email, :string, :null => false
      t.column :gender, :string, :null => false
      t.column :wins, :integer, :null => false, :default => 0
      t.column :losses, :integer, :null => false, :default => 0
      t.column :draws, :integer, :null => false, :default => 0
      t.column :kos, :integer, :null => false, :default => 0
      t.column :about, :text, :null => false
      t.column :min_weight, :float, :null => false, :default => 0
      t.column :max_weight, :float, :null => false, :default => 0
      t.column :preferred_rules, :string, :null => false
      t.column :status, :string, :null => false, :default => "ACTIVE"
      t.column :image_filename, :string, :default => "default_profile_M.gif"
      
      
      # Tracking Details
      t.column :created_at, :date, :null => false
      t.column :updated_at, :date, :null => false

    end
  end

  def self.down
    drop_table :fighters
  end
end