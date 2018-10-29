class AddDescriptionToPetition < ActiveRecord::Migration
  def change
    add_column :petitions, :description, :string
  end
end
