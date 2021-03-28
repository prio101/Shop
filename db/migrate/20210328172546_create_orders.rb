class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string  :name
      t.string  :street
      t.string  :zip_code
      t.string  :country
      t.string  :email
      t.integer  :account_number
      t.integer  :bank_issue_number
      t.references :payment_details
      t.timestamps
    end
  end
end
