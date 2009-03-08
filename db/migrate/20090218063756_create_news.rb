class CreateNews < ActiveRecord::Migration
  def self.up
    create_table :news do |t|
      t.column :created_at, :date, :null => false
      t.column :message, :string, :null => false
    end
  end

  def self.down
    drop_table :news
  end
end
