class ModifyUser < ActiveRecord::Migration
  def change
    remove_column :users, :first_name
    remove_column :users, :last_name
    add_column :users, :nit, :string
    add_column :users, :city_id, :integer
    add_column :users, :description, :string
  end
end
