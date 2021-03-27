class CreatePrices < ActiveRecord::Migration[6.0]
  def change
    create_table :prices do |t|
      t.decimal :price, precision: 8, scale: 2
      t.belongs_to  :products
      t.timestamps
    end
  end
end
