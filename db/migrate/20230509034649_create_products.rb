class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.float :current_price
      t.float :actual_price
      t.text :description

      t.timestamps
    end
  end
end
