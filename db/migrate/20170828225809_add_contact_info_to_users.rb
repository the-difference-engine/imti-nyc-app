class AddContactInfoToUsers < ActiveRecord::Migration[5.0]
  def self.up
    add_column :users, :street, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :country, :string
    add_column :users, :zip_code, :string
    add_column :users, :phone_number, :string
    add_column :users, :birth_place, :string
    add_column :users, :birth_date, :datetime
    add_column :users, :country_of_citizenship, :string
    add_column :users, :occupation, :string
    add_column :users, :ages_of_children, :string
    add_column :users, :name_of_spouse, :string
    execute "UPDATE users u SET street = (SELECT a.street FROM applications a WHERE u.id = a.user_id);"
    execute "UPDATE users u SET city = (SELECT a.city FROM applications a WHERE u.id = a.user_id);"
    execute "UPDATE users u SET state = (SELECT a.state FROM applications a WHERE u.id = a.user_id);"
    execute "UPDATE users u SET country = (SELECT a.country FROM applications a WHERE u.id = a.user_id);"
    execute "UPDATE users u SET zip_code = (SELECT a.zip_code FROM applications a WHERE u.id = a.user_id);"
    execute "UPDATE users u SET phone_number = (SELECT a.phone_number FROM applications a WHERE u.id = a.user_id);"
    execute "UPDATE users u SET birth_place = (SELECT a.birth_place FROM applications a WHERE u.id = a.user_id);"
    execute "UPDATE users u SET birth_date = (SELECT a.birth_date FROM applications a WHERE u.id = a.user_id);"
    execute "UPDATE users u SET country_of_citizenship = (SELECT a.country_of_citizenship FROM applications a WHERE u.id = a.user_id);"
    execute "UPDATE users u SET occupation = (SELECT a.occupation FROM applications a WHERE u.id = a.user_id);"
    execute "UPDATE users u SET ages_of_children = (SELECT a.ages_of_children FROM applications a WHERE u.id = a.user_id);"
    execute "UPDATE users u SET name_of_spouse = (SELECT a.name_of_spouse FROM applications a WHERE u.id = a.user_id);"
    remove_column :applications, :street
    remove_column :applications, :city
    remove_column :applications, :state
    remove_column :applications, :country
    remove_column :applications, :zip_code
    remove_column :applications, :phone_number
    remove_column :applications, :birth_place
    remove_column :applications, :birth_date
    remove_column :applications, :country_of_citizenship
    remove_column :applications, :occupation
    remove_column :applications, :ages_of_children
    remove_column :applications, :name_of_spouse
  end

  def self.down
    add_column :applications, :street, :string
    add_column :applications, :city, :string
    add_column :applications, :state, :string
    add_column :applications, :country, :string
    add_column :applications, :zip_code, :string
    add_column :applications, :phone_number, :string
    add_column :applications, :birth_place, :string
    add_column :applications, :birth_date, :datetime
    add_column :applications, :country_of_citizenship, :string
    add_column :applications, :occupation, :string
    add_column :applications, :ages_of_children, :string
    add_column :applications, :name_of_spouse, :string
    execute "UPDATE applications a SET street = (SELECT u.street FROM users u WHERE a.user_id = u.id);"
    execute "UPDATE applications a SET city = (SELECT u.city FROM users u WHERE a.user_id = u.id);"
    execute "UPDATE applications a SET state = (SELECT u.state FROM users u WHERE a.user_id = u.id);"
    execute "UPDATE applications a SET country = (SELECT u.country FROM users u WHERE a.user_id = u.id);"
    execute "UPDATE applications a SET zip_code = (SELECT u.zip_code FROM users u WHERE a.user_id = u.id);"
    execute "UPDATE applications a SET phone_number = (SELECT u.phone_number FROM users u WHERE a.user_id = u.id);"
    execute "UPDATE applications a SET birth_place = (SELECT u.birth_place FROM users u WHERE a.user_id = u.id);"
    execute "UPDATE applications a SET birth_date = (SELECT u.birth_date FROM users u WHERE a.user_id = u.id);"
    execute "UPDATE applications a SET country_of_citizenship = (SELECT u.country_of_citizenship FROM users u WHERE a.user_id = u.id);"
    execute "UPDATE applications a SET occupation = (SELECT u.occupation FROM users u WHERE a.user_id = u.id);"
    execute "UPDATE applications a SET ages_of_children = (SELECT u.ages_of_children FROM users u WHERE a.user_id = u.id);"
    execute "UPDATE applications a SET name_of_spouse = (SELECT u.name_of_spouse FROM users u WHERE a.user_id = u.id);"
    remove_column :users, :street
    remove_column :users, :city
    remove_column :users, :state
    remove_column :users, :country
    remove_column :users, :zip_code
    remove_column :users, :phone_number
    remove_column :users, :birth_place
    remove_column :users, :birth_date
    remove_column :users, :country_of_citizenship
    remove_column :users, :occupation
    remove_column :users, :ages_of_children
    remove_column :users, :name_of_spouse
  end
end
