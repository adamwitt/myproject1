class CreateGyms < ActiveRecord::Migration
  def self.up
    create_table :gyms do |t|
      
      # Public Details
      t.column :name, :string, :null => false
      t.column :first_name, :string, :null => false
      t.column :last_name, :string, :null => false
      t.column :phone, :string, :default => ""
      t.column :mobile, :string, :null => false
      t.column :email, :string, :null => false
      t.column :website, :string, :default => ""
      t.column :state, :string, :null => false
      t.column :address, :text, :null => false
      t.column :about, :text, :default => ""
      
      # Login details
      t.column :user_id, :string, :null => false
      t.column :password, :string, :null => false
      
      # Tracking Details
      t.column :created_at, :date, :null => false
      t.column :updated_at, :date, :null => false
      t.column :number_of_logins, :integer, :null => false, :default => 0
      t.column :consecutive_updates, :integer, :null => false, :default => 0
      t.column :last_updated, :date, :null => false
      
      # last_updated is set when the gym logs in and clicks "confirm" to a form which asks "is your fighter list up to date?" - or when they update their fighter details
      # Consecutive_updates is a counter which is incrememnted by a monthly script that checks if the last_updated date is inside the past 31 days. if not, then it gets set back to 0

    end
  end

  def self.down
    drop_table :gyms
  end
end
