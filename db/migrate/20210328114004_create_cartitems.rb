class CreateCartitems < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_items do |t|
      t.belongs_to  :cart
      t.belongs_to  :product
      t.belongs_to  :price
      t.timestamps
    end
  end
end
