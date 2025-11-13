class AddAmountToInputsAndOutputs < ActiveRecord::Migration[8.0]
  def change
    add_column :input_resources, :amount, :integer
    add_column :output_resources, :amount, :integer
  end
end
