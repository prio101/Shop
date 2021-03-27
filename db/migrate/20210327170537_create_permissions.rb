class CreatePermissions < ActiveRecord::Migration[6.0]
  def change
    create_table :permissions do |t|
      t.string  :resource_name
      t.string  :permissions_list, default: '[]'
      t.belongs_to :role
      t.timestamps
    end
  end
end
