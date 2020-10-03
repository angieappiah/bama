# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Designer.destroy_all
Designer.create!([{
  username: "Angie",
  email: "angie@angie.com",
  location: " ksi",
  phone: "454789743",
  password: "password"
},
{  username: "Ben",
email: "ben@ben.com",
location: " gh",
phone: "454780043",
password: "password"}])

Style.destroy_all
Style.create!([{
  name: "Painting",
  method: "acrylic paint"
},
{name: "Mosaic",
method: "papier mashe"}])

Piece.destroy_all
Piece.create!([{
  medium: "canvas",
  size: "landscape",
  comment: "all designs put together"
},
{  medium: "wood",
size: "portrait",
comment: "nice work "}])
