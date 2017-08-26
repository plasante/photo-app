# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.find_by(email: "pierre.lasante@videotron.ca")

if (user != nil) 
  user.destroy
end

user_pierre = User.create!(email: "pierre.lasante@videotron.ca",
                           password:              "123456",
                           password_confirmation: "123456")
                           
City.delete_all
mascouche = City.create( name: 'Mascouche' )
montreal  = City.create( name: 'Montreal' )
quebec    = City.create( name: 'Quebec' )
ottawa    = City.create( name: 'Ottawa' )

State.delete_all
quebec    = State.create( name: 'Quebec' )
ontario   = State.create( name: 'Ontario' )
alberta   = State.create( name: 'Alberta' )
newyork   = State.create( name: 'New York' )
wisconsin = State.create( name: 'Wisconsin' )

Country.delete_all
canada = Country.create( name: 'Canada' )
usa    = Country.create( name: 'USA' )

Address.delete_all
metro_mascouche_addresse = Address.create( number: '875' , street: 'Montee Masson', zip: 'J7K 3T3', city: mascouche, state: quebec, country: canada)
iga_mascouche_addresse   = Address.create( number: '65'  , street: 'Montee Masson', zip: 'J7K 3B4', city: mascouche, state: quebec, country: canada)
maxi_mascouche_addresse  = Address.create( number: '1100', street: 'Montee Masson', zip: 'J7K 3B8', city: mascouche, state: quebec, country: canada)

Store.delete_all
metro_mascouche_store = Store.create( name: 'Metro Mascouche', address: metro_mascouche_addresse)
iga_mascouche_store   = Store.create( name: 'IGA Mascouche', address: iga_mascouche_addresse)
maxi_mascouche_store  = Store.create( name: 'MAXI Mascouche', address: maxi_mascouche_addresse)

Provider.delete_all
provider_lactantia = Provider.create!(name: "Lactancia")
provider_quebon = Provider.create!(name: "Quebon")
provider_country_harvest = Provider.create!(name: "Country Harvest")
provider_maxwell_house = Provider.create!(name: "Maxwell House")
provider_general_mills = Provider.create!(name: "General Mills")
provider_iga = Provider.create!(name: "IGA")
provider_metro = Provider.create!(name: "Metro")
provider_maxi = Provider.create!(name: "Maxi")

Category.delete_all
category_produit_laitier   = Category.create!(name: "Lait")
category_produit_pain      = Category.create!(name: "Pain")
category_produit_cafe      = Category.create!(name: "Café")
category_produit_cereale   = Category.create!(name: "Céréales")
category_produit_viande    = Category.create!(name: "Viande")
category_produit_vin       = Category.create!(name: "Vin")
category_produit_biere     = Category.create!(name: "Biere")
category_produit_the       = Category.create!(name: "Thé")
category_produit_boisson   = Category.create!(name: "Boissons gazeuses")
category_produit_margarine = Category.create!(name: "Margarine")
category_produit_beurre    = Category.create!(name: "Beurre")
category_produit_eau       = Category.create!(name: "Eau")
category_produit_epice     = Category.create!(name: "Epices")
category_produit_pate      = Category.create!(name: "Pates alimentaires")

SubCategory.delete_all
subCategory_category_produit_laitier1 = category_produit_laitier.sub_categories.create!(sous_category: "Lait 0%")
subCategory_category_produit_laitier2 = category_produit_laitier.sub_categories.create!(sous_category: "Lait 1%")
subCategory_category_produit_laitier3 = category_produit_laitier.sub_categories.create!(sous_category: "Lait 2%")
subCategory_category_produit_laitier4 = category_produit_laitier.sub_categories.create!(sous_category: "Lait 3.25%")
subCategory_category_produit_pain     = category_produit_pain.sub_categories.create!(sous_category: "Pain blanc, blé entier")
subCategory_category_produit_cafe     = category_produit_cafe.sub_categories.create!(sous_category: "Café régulier")
subCategory_category_produit_cereale  = category_produit_cereale.sub_categories.create!(sous_category: "Céréale")
subCategory_category_produit_viande   = category_produit_viande.sub_categories.create!(sous_category: "Boeuf haché mi-maigre")

Description.delete_all
description_lait_1pct = Description.create!(description: "Lait 1%")
description_lait_2pct = Description.create!(description: "Lait 2%")
description_pain_blanc_ble_entier = Description.create!(description: "Pain blanc, blé entier")
description_cafe_regulier = Description.create!(description: "Café régulier")
description_cereale = Description.create!(description: "Céréale")
description_boeuf_hache_mi_maigre = Description.create!(description: "Boeuf haché mi-maigre")

Product.delete_all
#
# IGA
#
# Lait 2% Lactantia
Product.create!(provider_id: provider_lactantia.id,
                price: 399,
                format: "2000ml",
                unit_price: ((100 * 399) / 2000).to_i,
                description_id: description_lait_2pct.id,
                diabetic: false,
                category_id: category_produit_laitier.id,    
                store_id:    iga_mascouche_store.id)
# Lait 1% Lactantia
Product.create!(provider_id: provider_lactantia.id,
                price: 399,
                format: "2000ml",
                unit_price: ((100 * 399) / 2000).to_i,
                description_id: description_lait_1pct.id,
                diabetic: false,
                category_id: category_produit_laitier.id,    
                store_id:    iga_mascouche_store.id)
# Lait 2% Quebon                                             
Product.create!(provider_id: provider_quebon.id,
                price: 288,
                format: "2000ml",
                unit_price: ((100 * 288) / 2000).to_i,
                description_id: description_lait_2pct.id,
                diabetic: false,
                category_id: category_produit_laitier.id,    
                store_id:    iga_mascouche_store.id)
# Pain ble entier Country Harvest                                             
Product.create!(provider_id: provider_country_harvest.id,
                price: 489,
                format: "600g",
                description_id: description_pain_blanc_ble_entier.id,
                diabetic: true,
                category_id: category_produit_pain.id,
                store_id:    iga_mascouche_store.id)
# Cafe regulier Maxwell House
Product.create!(provider_id: provider_maxwell_house.id,
                price: 899,
                format: "263g",
                description_id: description_cafe_regulier.id,
                diabetic: false,
                category_id: category_produit_cafe.id,
                store_id:    iga_mascouche_store.id)
# Cereale Cheerios
Product.create!(provider_id: provider_general_mills.id,
                price: 799,
                format: "525g",
                description_id: description_cereale.id,
                diabetic: true,
                category_id: category_produit_cereale.id,
                store_id:    iga_mascouche_store.id)
# Boeuf hache mi-maigre
Product.create!(provider_id: provider_iga.id,
                price: 989,
                format: "1000g",
                description_id: description_boeuf_hache_mi_maigre.id,
                diabetic: false,
                category_id: category_produit_viande.id,
                store_id:    iga_mascouche_store.id)
#
# METRO
#
Product.create!(provider_id: provider_lactantia.id,
                price: 398,
                format: "2000ml",
                description_id: description_lait_2pct.id,
                diabetic: false,
                category_id: category_produit_laitier.id,
                store_id:    metro_mascouche_store.id)

Product.create!(provider_id: provider_country_harvest.id,
                price: 488,
                format: "600g",
                description_id: description_pain_blanc_ble_entier.id,
                diabetic: true,
                category_id: category_produit_pain.id,
                store_id:    metro_mascouche_store.id)

Product.create!(provider_id: provider_maxwell_house.id,
                price: 898,
                format: "263g",
                description_id: description_cafe_regulier.id,
                diabetic: false,
                category_id: category_produit_cafe.id,
                store_id:    metro_mascouche_store.id)

Product.create!(provider_id: provider_general_mills.id,
                price: 798,
                format: "525g",
                description_id: description_cereale.id,
                diabetic: true,
                category_id: category_produit_cereale.id,
                store_id:    metro_mascouche_store.id)

Product.create!(provider_id: provider_metro.id,
                price: 988,
                format: "1000g",
                description_id: description_boeuf_hache_mi_maigre.id,
                diabetic: false,
                category_id: category_produit_viande.id,
                store_id:    metro_mascouche_store.id)
#
# Maxi
#
Product.create!(provider_id: provider_lactantia.id,
                price: 397,
                format: "2000ml",
                description_id: description_lait_2pct.id,
                diabetic: false,
                category_id: category_produit_laitier.id,
                store_id:    maxi_mascouche_store.id)

Product.create!(provider_id: provider_country_harvest.id,
                price: 487,
                format: "600g",
                description_id: description_pain_blanc_ble_entier.id,
                diabetic: true,
                category_id: category_produit_pain.id,
                store_id:    maxi_mascouche_store.id)

Product.create!(provider_id: provider_maxwell_house.id,
                price: 897,
                format: "263g",
                description_id: description_cafe_regulier.id,
                diabetic: false,
                category_id: category_produit_cafe.id,
                store_id:    maxi_mascouche_store.id)

Product.create!(provider_id: provider_general_mills.id,
                price: 797,
                format: "525g",
                description_id: description_cereale.id,
                diabetic: true,
                category_id: category_produit_cereale.id,
                store_id:    maxi_mascouche_store.id)

Product.create!(provider_id: provider_maxi.id,
                price: 987,
                format: "1000g",
                description_id: description_boeuf_hache_mi_maigre.id,
                diabetic: false,
                category_id: category_produit_viande.id,
                store_id:    maxi_mascouche_store.id)

list_pierre = List.create!(user_id: user_pierre.id)

list_category_lait    = ListCategory.create!( list_id:    list_pierre.id,
                                              category_id: category_produit_laitier.id,
                                              description_id: description_lait_2pct.id)
list_category_pain    = ListCategory.create!( list_id:    list_pierre.id,
                                              category_id: category_produit_pain.id,
                                              description_id: description_pain_blanc_ble_entier.id)
list_category_cafe    = ListCategory.create!( list_id:    list_pierre.id,
                                              category_id: category_produit_cafe.id,
                                              description_id: description_cafe_regulier.id)
list_category_cereale = ListCategory.create!( list_id:    list_pierre.id,
                                              category_id: category_produit_cereale.id,
                                              description_id: description_cereale.id)
list_category_viande  = ListCategory.create!( list_id:    list_pierre.id,
                                              category_id: category_produit_viande.id,
                                              description_id: description_boeuf_hache_mi_maigre.id)
                                              
