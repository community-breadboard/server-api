# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

bread = FoodCategory.create({ label: 'Bread', image_svg_name: 'bread'})
dairy = FoodCategory.create({ label: 'Dairy / Eggs', image_svg_name: 'dairy'})
#sweets = FoodCategory.create({ label: 'Honey / Jam / Syrup', image_svg_name: 'sweets.jpeg'})

juniper = ProducerEntity.create({name: 'Juniper Cottage Bake Shop'})
benedikt = ProducerEntity.create({name: 'Benedikt Dairy'})
tuckaway = ProducerEntity.create({name: 'Tuckaway Farm'})

mountain = FoodItem.create({name: 'Maine Mountain Bread', unit_label_singular: 'boule', unit_label_plural: 'boules', unit_cost: 6.75, description: 'Hearty, nutritious and delicious. A mix of pumpkin, sunflower and sesame seeds encase a loaf baked with Maine grown heritage wheat. A beautiful bread.', ingredients: 'Organic white wheat flour, water, organic sifted whole wheat flour, organic pumpkin, sunflower and sesame seeds, sea salt.', image: 'mountain.jpg', food_category: bread, producer_entity: juniper});

levain = FoodItem.create({name: 'Country Levain', unit_label_singular: 'loaf', unit_label_plural: 'loaves', unit_cost: 6, description: 'A rustic levain blending three excellent flours.', ingredients: 'Organic white wheat flour, water, organic whole rye flour, sifted whole wheat flour, sea salt', image: 'country_levain.jpg', food_category: bread, producer_entity: juniper});

spelt = FoodItem.create({name: 'Spelt Boule', unit_label_singular: 'boule', unit_label_plural: 'boules', unit_cost: 6, description: 'Spelt flour gives this bread its great texture and slightly nutty flavor. Low gluten.', ingredients: 'Organic white spelt flour, water, organic whole spelt flour, sea salt', image: 'spelt_boule.jpg', food_category: bread, producer_entity: juniper});

eggs = FoodItem.create({name: 'Eggs', unit_label_singular: 'dozen', unit_label_plural: 'dozen', description: 'Farm fresh eggs', ingredients: '', image: 'eggs.jpg', food_category: dairy, producer_entity: tuckaway});

milk = FoodItem.create({name: 'Milk', unit_label_singular: 'quart', unit_label_plural: 'quarts', description: 'Raw Milk', ingredients: '', image: 'milk.jpg', food_category: dairy, producer_entity: benedikt});

durham1 = FamilyGroup.create({name:'Durham1'});
smith = Family.create({name: 'Smith Family', family_group: durham1});
jane = Consumer.new(first_name: 'Jane', last_name: 'Smith', balance: 0, email: 'janesmith@gmail.com', password: 'tuckawayfarmiscool', password_confirmation: 'tuckawayfarmiscool', family: smith)
jane.save
john = Consumer.new(first_name: 'John', last_name: 'Smith', balance: 0, email: 'johnsmith@gmail.com', password: 'tuckawayfarmiscool', password_confirmation: 'tuckawayfarmiscool', family: smith)
john.save

jones = Family.create({name: 'Jones Family', family_group: durham1});
sarah = Consumer.new(first_name: 'Sarah', last_name: 'Jones', balance: 0, email: 'sarahjones@gmail.com', password: 'tuckawayfarmiscool', password_confirmation: 'tuckawayfarmiscool', family: jones)
sarah.save

anderson = Family.create({name: 'Anderson Family'});
chris = Consumer.new(first_name: 'Chris', last_name: 'Anderson', balance: 0, email: 'chrisanderson@gmail.com', password: 'tuckawayfarmiscool', password_confirmation: 'tuckawayfarmiscool', family: anderson)
chris.save
