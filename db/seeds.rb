# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env.development?
  # creating admin
  admin = User.create!(
            username: 'admin',
            password: 'password'
          )

  # Role Create
  admin_role = Role.create!(
    name: 'admin',
    summary: 'Admin Role',
    user_id: admin.id 
  )

  # permissions
  Permission.create!(
    resource_name: 'products',
    permissions_list: 'index, create, new, edit, update, destroy',
    role_id: admin_role.id
  )

  Permission.create!(
    resource_name: 'prices',
    permissions_list: 'index, create, new, edit, update, destroy',
    role_id: admin_role.id
  )

  Permission.create!(
    resource_name: 'users',
    permissions_list: 'index, create, new, edit, update, destroy',
    role_id: admin_role.id
  )
end