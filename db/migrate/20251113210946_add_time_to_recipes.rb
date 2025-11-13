class AddTimeToRecipes < ActiveRecord::Migration[8.0]
  def change
    add_column :recipes, :time, :integer
  end
end
