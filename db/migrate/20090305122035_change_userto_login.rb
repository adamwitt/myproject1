class ChangeUsertoLogin < ActiveRecord::Migration
  def self.up
    rename_column :gyms, :user_id, :login_id
  end

  def self.down
    rename_column :gyms, :login_id, :user_id
  end
end
