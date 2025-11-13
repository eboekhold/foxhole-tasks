class AddFactionToRecipes < ActiveRecord::Migration[8.0]
  def change
    add_column :recipes, :faction, :string
  end
end
