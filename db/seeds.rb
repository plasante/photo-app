# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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
metro_mascouche = Store.create( name: 'Metro Mascouche', address: metro_mascouche_addresse)
iga_mascouche   = Store.create( name: 'IGA Mascouche', address: iga_mascouche_addresse)
maxi_mascouche  = Store.create( name: 'MAXI Mascouche', address: maxi_mascouche_addresse)
