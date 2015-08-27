# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ReviewType.create(:review_type_id => 0, :name => "recipe")
ReviewType.create(:review_type_id => 1, :name => "chef")
ReviewType.create(:review_type_id => 2, :name => "article") 