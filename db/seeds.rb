# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Role.create(:name => 'Administrator', :description => 'Users, that have control over every aspect of this framework', :created_at => '2000-01-01 00:00:00.000000', :updated_at => '2000-01-01 00:00:00.000000')
Role.create(:name => 'Users', :description => 'Regular users, that can e.g. create folders, add media and comment on it', :created_at => '2000-01-01 00:00:00.000000', :updated_at => '2000-01-01 00:00:00.000000')
Role.create(:name => 'Public', :description => 'Every folder, that is marked as Public is readable world-wide without having to log-in', :created_at => '2000-01-01 00:00:00.000000', :updated_at => '2000-01-01 00:00:00.000000')
User.create(:email => '20100922-github@schleinkofer.name', :password => 'administrator', :password_confirmation => 'administrator', :username => 'administrator', :roles => Role.where(:name => 'Administrator'))
