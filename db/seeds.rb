# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

standard_salt = "asdasdastr4325234324sdfds"
standard_crypted_password = Sorcery::CryptoProviders::BCrypt.encrypt("password", standard_salt)

users = User.create(
  [
    {
      email: 'super_admin_1@gmail.com',
      salt: standard_salt,
      crypted_password: standard_crypted_password
    },
    {
      email: 'organization_admin_1@hotmail.com',
      salt: standard_salt,
      crypted_password: standard_crypted_password
    },
    {
      email: 'organization_admin_2@yahoo.com',
      salt: standard_salt,
      crypted_password: standard_crypted_password
    }
  ]
)

organizations = Organization.create(
  [
    {
      name: 'Generic tech business'
    },
    {
      name: 'TicketHub.com'
    },
    {
      name: 'Public Healthcare Website'
    }
  ]
)

# Set associations between users and organizations

user1, user2, user3 = users
org1, org2, org3 = organizations

user2.organizations << org1
user2.add_role(:organization_admin, org1)

user3.organizations << org2
user3.add_role(:organization_admin, org2)
user3.organizations << org3
user3.add_role(:organization_admin, org3)
