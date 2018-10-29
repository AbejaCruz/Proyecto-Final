class AddPrefixCodeUsers < ActiveRecord::Migration
  def change
    remove_column :users, :role
    add_column :users, :prefix, :string
  end
end
