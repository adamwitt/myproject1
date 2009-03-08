class AddSecretQuestion < ActiveRecord::Migration
  def self.up
    add_column :gyms, :secret_question, :string, :default => ""
    add_column :gyms, :secret_answer, :string, :default => ""
  end

  def self.down
    remove_column :gyms, :secret_question, :string, :default => ""
    remove_column :gyms, :secret_answer, :string, :default => ""
  end
end
