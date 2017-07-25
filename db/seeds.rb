# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

waldorf = Address.create({name: 'Seacoast Waldorf School', street: "403 ME-236", zip_code: "03903"})

bread = FoodCategory.create({ label: 'Bread', image_svg_name: 'bread'})
dairy = FoodCategory.create({ label: 'Dairy / Eggs', image_svg_name: 'dairy'})
#sweets = FoodCategory.create({ label: 'Honey / Jam / Syrup', image_svg_name: 'sweets.jpeg'})

juniper = ProducerEntity.create({name: 'Juniper Cottage Bake Shop', offerings: 'remote'})
benedikt = ProducerEntity.create({name: 'Benedikt Dairy'})
tuckaway = ProducerEntity.create({name: 'Tuckaway Farm', offerings: 'local,remote_group'})


juniper_waldorf = OrderPickupSchedule.create({producer_entity: juniper, address: waldorf, sale_start_day_of_week: 5, sale_start_hour: 17, sale_start_minute: 0, sale_end_day_of_week: 3, sale_end_hour: 12, sale_end_minute: 0, pickup_day_of_week: 5, pickup_start_hour: 14, pickup_start_minute: 0, pickup_end_hour: 16, pickup_end_minute:0});


mountain = FoodItem.create({name: 'Maine Mountain Bread', unit_label_singular: 'boule', unit_label_plural: 'boules', description: 'Hearty, nutritious and delicious. A mix of pumpkin, sunflower and sesame seeds encase a loaf baked with Maine grown heritage wheat. A beautiful bread.', ingredients: 'Organic white wheat flour, water, organic sifted whole wheat flour, organic pumpkin, sunflower and sesame seeds, sea salt.', image: 'mountain.jpg', food_category: bread, producer_entity: juniper});

levain = FoodItem.create({name: 'Country Levain', unit_label_singular: 'loaf', unit_label_plural: 'loaves', description: 'A rustic levain blending three excellent flours.', ingredients: 'Organic white wheat flour, water, organic whole rye flour, sifted whole wheat flour, sea salt', image: 'country_levain.jpg', food_category: bread, producer_entity: juniper});

spelt = FoodItem.create({name: 'Spelt Boule', unit_label_singular: 'boule', unit_label_plural: 'boules', description: 'Spelt flour gives this bread its great texture and slightly nutty flavor. Low gluten.', ingredients: 'Organic white spelt flour, water, organic whole spelt flour, sea salt', image: 'spelt_boule.jpg', food_category: bread, producer_entity: juniper});

eggs = FoodItem.create({name: 'Eggs', unit_label_singular: 'dozen', unit_label_plural: 'dozen', description: 'Farm fresh eggs', ingredients: '', image: 'eggs.jpg', food_category: dairy, producer_entity: tuckaway});

milk = FoodItem.create({name: 'Milk', unit_label_singular: 'quart', unit_label_plural: 'quarts', description: 'Raw Milk', ingredients: '', image: 'milk.jpg', food_category: dairy, producer_entity: benedikt});

juniper_spelt = SellableFoodItem.create({food_item: spelt, seller: juniper, wholeseller: juniper, unit_cost:6});
juniper_levain = SellableFoodItem.create({food_item: levain, seller: juniper, wholeseller: juniper, unit_cost:6});
juniper_mountain = SellableFoodItem.create({food_item: mountain, seller: juniper, wholeseller: juniper, unit_cost:6.75});
juniper_milk = SellableFoodItem.create({food_item: milk, seller: juniper, wholeseller: tuckaway, unit_cost:5, wholeseller_unit_cost:4.5});
juniper_eggs = SellableFoodItem.create({food_item: eggs, seller: juniper, wholeseller: tuckaway, unit_cost:5, wholeseller_unit_cost:4.5});


sonke = Producer.new(first_name: 'Sonke', last_name: 'Dornblut', email: 'sonke@gmail.com', password: 'eatlocal', password_confirmation: 'eatlocal', producer_entity: juniper)
sonke.save
sarah = Producer.new(first_name: 'Sarah', last_name: 'Cox', email: 'sarah@gmail.com', password: 'eatlocal', password_confirmation: 'eatlocal', producer_entity: tuckaway)
sarah.save


beers = Family.create({name: 'Beer Family', producer_entity: juniper, order_pickup_schedule: juniper_waldorf});
cy = Consumer.new(first_name: 'Cyrus', last_name: 'Beer', balance: 0, email: 'cyrus@gmail.com', password: 'eatlocal', password_confirmation: 'eatlocal', family: beers)
cy.save

ganevs = Family.create({name: 'Ganev Family', producer_entity: juniper, order_pickup_schedule: juniper_waldorf});
ruth = Consumer.new(first_name: 'Ruth', last_name: 'Ganev', balance: 0, email: 'ruth@gmail.com', password: 'eatlocal', password_confirmation: 'eatlocal', family: ganevs)
ruth.save
