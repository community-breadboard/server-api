# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

waldorf = Address.create({street: "403 ME-236", zip_code: "03903"})

bread = FoodCategory.create({ label: 'Bread', image_svg_name: 'bread'})
dairy = FoodCategory.create({ label: 'Dairy / Eggs', image_svg_name: 'dairy'})
#sweets = FoodCategory.create({ label: 'Honey / Jam / Syrup', image_svg_name: 'sweets.jpeg'})

juniper = ProducerEntity.create({name: 'Juniper Cottage Bake Shop', offerings: 'remote'})
benedikt = ProducerEntity.create({name: 'Benedikt Dairy'})
tuckaway = ProducerEntity.create({name: 'Tuckaway Farm', offerings: 'local,remote_group'})


juniper_waldorf = OrderPickupSchedule.create({producer_entity: juniper, address: waldorf, sale_start_day_of_week: 5, sale_start_hour: 17, sale_start_minute: 0, sale_end_day_of_week: 3, sale_end_hour: 12, sale_end_minute: 0, pickup_start_day_of_week: 5, pickup_start_hour: 14, pickup_start_minute: 0, pickup_end_day_of_week: 5, pickup_end_hour: 16, pickup_end_minute:0});


mountain = FoodItem.create({name: 'Maine Mountain Bread', unit_label_singular: 'boule', unit_label_plural: 'boules', description: 'Hearty, nutritious and delicious. A mix of pumpkin, sunflower and sesame seeds encase a loaf baked with Maine grown heritage wheat. A beautiful bread.', ingredients: 'Organic white wheat flour, water, organic sifted whole wheat flour, organic pumpkin, sunflower and sesame seeds, sea salt.', image: 'mountain.jpg', food_category: bread, producer_entity: juniper});

levain = FoodItem.create({name: 'Country Levain', unit_label_singular: 'loaf', unit_label_plural: 'loaves', description: 'A rustic levain blending three excellent flours.', ingredients: 'Organic white wheat flour, water, organic whole rye flour, sifted whole wheat flour, sea salt', image: 'country_levain.jpg', food_category: bread, producer_entity: juniper});

spelt = FoodItem.create({name: 'Spelt Boule', unit_label_singular: 'boule', unit_label_plural: 'boules', description: 'Spelt flour gives this bread its great texture and slightly nutty flavor. Low gluten.', ingredients: 'Organic white spelt flour, water, organic whole spelt flour, sea salt', image: 'spelt_boule.jpg', food_category: bread, producer_entity: juniper});

eggs = FoodItem.create({name: 'Eggs', unit_label_singular: 'dozen', unit_label_plural: 'dozen', description: 'Farm fresh eggs', ingredients: '', image: 'eggs.jpg', food_category: dairy, producer_entity: tuckaway});

milk = FoodItem.create({name: 'Milk', unit_label_singular: 'quart', unit_label_plural: 'quarts', description: 'Raw Milk', ingredients: '', image: 'milk.jpg', food_category: dairy, producer_entity: benedikt});

juniper_spelt = SellableFoodItem.create({food_item: spelt, seller: juniper, unit_cost:6});
juniper_levain = SellableFoodItem.create({food_item: levain, seller: juniper, unit_cost:6});
juniper_milk = SellableFoodItem.create({food_item: milk, seller: juniper , unit_cost:5});


durham1 = FamilyGroup.create({name:'Durham1'});
smith = Family.create({name: 'Smith Family', family_group: durham1, producer_entity: tuckaway});
jane = Consumer.new(first_name: 'Jane', last_name: 'Smith', balance: 0, email: 'janesmith@gmail.com', password: 'eatlocal', password_confirmation: 'eatlocal', family: smith)
jane.save
john = Consumer.new(first_name: 'John', last_name: 'Smith', balance: 0, email: 'johnsmith@gmail.com', password: 'eatlocal', password_confirmation: 'eatlocal', family: smith)
john.save

jones = Family.create({name: 'Jones Family', family_group: durham1, producer_entity: tuckaway});
sarah = Consumer.new(first_name: 'Sarah', last_name: 'Jones', balance: 0, email: 'sarahjones@gmail.com', password: 'eatlocal', password_confirmation: 'eatlocal', family: jones)
sarah.save

anderson = Family.create({name: 'Anderson Family', producer_entity: tuckaway});
chris = Consumer.new(first_name: 'Chris', last_name: 'Anderson', balance: 0, email: 'chrisanderson@gmail.com', password: 'eatlocal', password_confirmation: 'eatlocal', family: anderson)
chris.save

baker = Family.create({name: 'Baker Family', producer_entity: juniper});
ed = Consumer.new(first_name: 'Ed', last_name: 'Baker', balance: 0, email: 'edbaker@gmail.com', password: 'eatlocal', password_confirmation: 'eatlocal', family: baker)
ed.save
