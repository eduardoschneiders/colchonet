# encoding: utf-8
namespace :app do
  desc "Encrypt all passwords that wasn't processed yet in the database"
  task migrate_passwords: :environment do
    unless User.attribute_names.include? 'password'
      puts 'Passwords already migrated, done.'
      return
    end

    User.find_each do |user|
      puts "Migrating user ##{user.id} #{user.full_name}"
      unencripted_password = user.attributes["password"]

      user.password = unencripted_password
      user.password_confirmation = unencripted_password

      user.save!
    end
  end
end
