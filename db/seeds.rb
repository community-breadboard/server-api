# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

bread = FoodCategory.create({ label: 'Bread', image_svg_name: 'bread'})

juniper = ProducerEntity.create({name: 'Juniper Cottage Bake Shop'})
benedikt = ProducerEntity.create({name: 'Benedikt Dairy'})

mountain = FoodItem.create({name: 'Maine Mountain Bread', unit_label_singular: 'boule', unit_label_plural: 'boules', unit_cost: 6.75, description: 'Hearty, nutritious and delicious. A mix of pumpkin, sunflower and sesame seeds encase a loaf baked with Maine grown heritage wheat. A beautiful bread.', ingredients: 'Organic white wheat flour, water, organic sifted whole wheat flour, organic pumpkin, sunflower and sesame seeds, sea salt.', image: 'mountain.jpg', food_category: bread, producer_entity: juniper});
