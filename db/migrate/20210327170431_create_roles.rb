class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.string  :name
      t.string  :summary
      t.belongs_to :user
      t.timestamps
    end
  end
end
