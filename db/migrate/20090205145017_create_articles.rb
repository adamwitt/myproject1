class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.column :created_at, :date, :null => false
      t.column :author, :string, :null => false
      t.column :title, :string, :null => false
      t.column :content, :text, :null => false
    end
  end

  def self.down
    drop_table :articles
  end
end
