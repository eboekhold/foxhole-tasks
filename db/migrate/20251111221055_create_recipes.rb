class CreateRecipes < ActiveRecord::Migration[8.0]
  def change
    create_table :recipes do |t|
      t.belongs_to :structure

      t.timestamps
    end

    create_table :input_resources do |t|
      t.belongs_to :resource
      t.belongs_to :recipe

      t.timestamps
    end

    create_table :output_resources do |t|
      t.belongs_to :resource
      t.belongs_to :recipe

      t.timestamps
    end
  end
end
