class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :email
      t.float :total
      t.text :address
      t.integer :number
      t.string :transection_id

      t.timestamps
    end
  end
end
