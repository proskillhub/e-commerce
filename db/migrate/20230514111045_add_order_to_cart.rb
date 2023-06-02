class AddOrderToCart < ActiveRecord::Migration[7.0]
  def change
    add_reference :carts, :order, foreign_key: true
    add_column :carts, :isorder, :boolean, default: false
  end
end
