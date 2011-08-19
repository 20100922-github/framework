# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Role.create(:name => 'Administrator', :description => 'Users, that have control over every aspect of this framework', :created_at => '2000-01-01 00:00:00.000000', :updated_at => '2000-01-01 00:00:00.000000')
Role.create(:name => 'Users', :description => 'Regular users, that can e.g. create folders, add media and comment on it', :created_at => '2000-01-01 00:00:00.000000', :updated_at => '2000-01-01 00:00:00.000000')
User.create(:email => '20100922-github@schleinkofer.name', :password => 'administrator', :password_confirmation => 'administrator', :username => 'administrator', :roles => Role.where(:name => 'Administrator'))
Group.create(:name => 'Family', :description => 'All family members', :created_at => '2000-01-01 00:00:00.000000', :updated_at => '2000-01-01 00:00:00.000000')
Group.create(:name => 'Friends', :description => 'All friends', :created_at => '2000-01-01 00:00:00.000000', :updated_at => '2000-01-01 00:00:00.000000')
Group.create(:name => 'Co-Workers', :description => 'All co-workers', :created_at => '2000-01-01 00:00:00.000000', :updated_at => '2000-01-01 00:00:00.000000')
