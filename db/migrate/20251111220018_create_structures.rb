class CreateStructures < ActiveRecord::Migration[8.0]
  def change
    create_table :structures do |t|
      t.string :name

      t.timestamps
    end
  end
end
