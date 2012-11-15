# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(:name => "Administrator", :email => 'admin@bpe.com', :password => 'secret', :password_confirmation => 'secret')

bhkconfigs = ['PG','1RK','1BHK','2BHK','2.5BHK','3BHK','4BHK','Villa' ]
qualities = ['Budget','Regular','Great']
building_tags = ['Clubhouse','Tennis','Badminton','Table Tennis','Squash','Swimming Pool', 'Gym','Childrens Play Area','Convenient Visitor Parking','Gated Community','Lifts', 'Security']
flat_tags = ['Furnished','Semi-furnished','Unfurnished','Can be furnished','Can be unfurnished', 'White Goods', 'Furniture','Modular Kitchen','Piped Gas','Wardrobes','Air Conditioners','Covered Parking','Open Parking','Additional Parking','Indian Toilet','Western Toilet','Balcony','Servants Quarters']
contact_tags = ['Landlord','Tenant','Employee','Coordinator','Broker','Reference','Priority','Important','Ignore']
flat_contact_tags = ['Landlord','Tenant','Employee','Broker']


City.create!(:name => "Mumbai")

bhkconfigs.each do |bhkconfig|
  BhkConfig.create!(:name => bhkconfig)
end

qualities.each_with_index do |quality, index|
  Quality.create!(:name => quality, :value => index)
end

building_tags.each do |tag|
  ActsAsTaggableOn::Tag.new(:name => tag, :focus=>"building").save
end

flat_tags.each do |tag|
  ActsAsTaggableOn::Tag.new(:name => tag, :focus=>"flat").save
end

contact_tags.each do |tag|
  ActsAsTaggableOn::Tag.new(:name => tag, :focus=>"contact").save
end

flat_contact_tags.each do |tag|
  ActsAsTaggableOn::Tag.new(:name => tag, :focus=>"flatcontact").save
end

