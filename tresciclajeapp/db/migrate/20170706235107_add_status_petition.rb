class AddStatusPetition < ActiveRecord::Migration
  def change
    add_column :petitions, :status, :string
  end
end
