class AddAliasToResources < ActiveRecord::Migration[8.0]
  def change
    add_column :resources, :alias, :string
  end
end
