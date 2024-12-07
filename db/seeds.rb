# This file should ensure the existence of records required to run the application in every environment (production, development, test).
# The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Upload a picture to Cloudinary and return the public_id on success.
def upload(url)
  begin
    Cloudinary::Uploader.upload(url)["public_id"]
  rescue => e
    Rails.logger.warn "Cloudinary upload failed: #{e.message}"
    nil
  end
end

def create_user(first_name:, last_name:, email:, phone:, password:, upload_url:)
  public_id = upload(upload_url)

  if public_id
    User.create(first_name:, last_name:, email:, phone:, password:, picture: public_id)
  else
    User.create(first_name:, last_name:, email:, phone:, password:)
  end
end

def create_cafe(name:, address:, email:, password:, borough:, neighborhood:, upload_url:)
  public_id = upload(upload_url)

  if public_id
    Cafe.create(name:, address:, email:, password:, borough:, neighborhood:, picture: public_id)
  else
    Cafe.create(name:, address:, email:, password:, borough:, neighborhood:)
  end
end

def random_phone()
  Random.new.rand(1_000_000_000..9_999_999_999).to_s
end

prices = [2.85, 3.45, 3.95, 3.35, 4.45, 1.75, 2.10, 3.65, 4.65, 2.35, 2.55]
drinks = [
  "Americano",
  "Latte",
  "Cappuccino",
  "Macchiato",
  "Single origin aeropress",
  "Pour over",
  "Drip",
  "Espresso",
  "Cortado",
  "Flat white",
  "Affogato"
]

# create_user(
#   first_name: "Travis",
#   last_name: "Allen",
#   email: "travis.william.allen@gmail.com",
#   phone: "3475998150",
#   password: "password",
#   upload_url: "https://lh4.googleusercontent.com/-ORtfJ8UGvU4/VDRhkx66wgI/AAAAAAAAADE/poe4URxiJvE/s702-no/50402df2-8c88-490d-86ef-b558d035a1ca"
# )

# create_user(
#   first_name: "Leah",
#   last_name: "Goldberg",
#   email: "leahgoldberg31@gmail.com",
#   phone: "2064326178",
#   password: "password",
#   upload_url: "https://lh4.googleusercontent.com/-7EzpM0oSAYc/AAAAAAAAAAI/AAAAAAAAAdw/4T0tiqCAtcQ/photo.jpg"
# )

# 25.times do
#   n = Faker::Name.first_name
#   User.create(
#     first_name: n,
#     last_name: Faker::Name.last_name,
#     password: "password",
#     email:"#{n}#{rand(1000)}@example.com",
#     phone: random_phone()
#   )
# end

create_cafe(
  name: "Bluestone Lane",
  address: "30 Broad St, New York, NY 10004",
  email: "bluestone@gmail.com",
  password: "password",
  borough: "Manhattan",
  neighborhood: "FiDi",
  upload_url: "https://lh4.googleusercontent.com/-7EzpM0oSAYc/AAAAAAAAAAI/AAAAAAAAAdw/4T0tiqCAtcQ/photo.jpg"
)

create_cafe(
  name: "Bedford Hill",
  address: "343 Franklin Ave, Brooklyn, NY 11238",
  email: "cafe25@example.com",
  password: "password",
  borough: "Brooklyn",
  neighborhood: "Bed Stuy",
  upload_url: "http://www.bedfordhillbrooklyn.com/images/5147932078_23a5479fac_b.jpg"
)

create_cafe(
  name: "Devocion",
  address: "69 Grand St, Brooklyn, NY 11249",
  email: "cafe26@example.com",
  password: "password",
  borough: "Brooklyn",
  neighborhood: "Williamsburg",
  upload_url: "http://bedfordandbowery.com/wp-content/uploads/2014/12/IMG_23651.jpg"
)

create_cafe(
  name: "Budin",
  address: "114 Greenpoint Ave, Brooklyn, NY 11222",
  email: "cafe31@example.com",
  password: "password",
  borough: "Brooklyn",
  neighborhood: "Greenpoint",
  upload_url: "http://www.shopkeep.com/wp-content/uploads/2014/10/IMG_7523-e1412879270908.jpg"
)

create_cafe(
  name: "Breukelen",
  address: "764 Franklin Ave, Brooklyn, NY 11238",
  email: "cafe32@example.com",
  password: "password",
  borough: "Brooklyn",
  neighborhood: "Crown Heights",
  upload_url: "http://drinks.seriouseats.com/images/2012/09/SE-bruekelen.jpg"
)

create_cafe(
  name: "66 Hope Street",
  address: "66 Hope St, Brooklyn, NY 11211",
  email: "cafe33@example.com",
  password: "password",
  borough: "Brooklyn",
  neighborhood: "Williamsburg",
  upload_url: "https://scontent-lga1-1.xx.fbcdn.net/hphotos-xfa1/t31.0-8/1269303_385221034936843_71467525_o.jpg"
)

create_cafe(
  name: "Ninth Street Espresso",
  address: "700 E 9th St, New York, NY 10009",
  email: "cafe23@example.com",
  password: "password",
  borough: "Manhattan",
  neighborhood: "East Village",
  upload_url: "http://manseekingcoffee.com/wp-content/uploads/2010/02/ninthstreetoutside.jpg"
)

create_cafe(
  name: "Kaffe 1668",
  address: "275 Greenwich St, New York, NY 10007",
  email: "cafe3@example.com",
  password: "password",
  borough: "Manhattan",
  neighborhood: "Tribeca",
  upload_url: "http://acdn.architizer.com/mediadata/projects/432009/38d3ff4f.jpg"
)

create_cafe(
  name: "La Colombe Torrefaction",
  address: "319 Church St, New York, NY 10013",
  email: "cafe9@example.com",
  password: "password",
  borough: "Manhattan",
  neighborhood: "Tribeca",
  upload_url: "http://www.jinhwafication.com/.a/6a0147e017d0c6970b0147e0d21078970b-pi"
)

create_cafe(
  name: "Abraço Espresso",
  address: "86 E 7th St, New York, NY 10003",
  email: "cafe11@example.com",
  password: "password",
  borough: "Manhattan",
  neighborhood: "East Village",
  upload_url: "http://www.nycvelo.com/wp-content/uploads/2011/03/abraco3.jpg"
)

create_cafe(
  name: "Gimme! Coffee",
  address: "228 Mott St, New York, NY 10012",
  email: "cafe13@example.com",
  password: "password",
  borough: "Manhattan",
  neighborhood: "SoHo",
  upload_url: "http://www.brian-coffee-spot.com/wp-content/uploads/wow-slider-plugin/90/images/dsc_9183a.jpg"
)

create_cafe(
  name: "Bluestockings",
  address: "172 Allen St, New York, NY 10002",
  email: "cafe14@example.com",
  password: "password",
  borough: "Manhattan",
  neighborhood: "Lower East Side",
  upload_url: "http://eng31131.pressbooks.com/files/2013/04/P1050762-2.jpg"
)

create_cafe(
  name: "Nectar Coffee Shop",
  address: "1022 Madison Ave # 1, New York, NY 10075",
  email: "cafe19@example.com",
  password: "password",
  borough: "Manhattan",
  neighborhood: "Upper East Side",
  upload_url: "https://c1.staticflickr.com/3/2862/9406839709_01a8b2d2d9_b.jpg"
)

create_cafe(
  name: "Champignon Cafe",
  address: "1389 Madison Ave, New York, NY 10029",
  email: "cafe20@example.com",
  password: "password",
  borough: "Manhattan",
  neighborhood: "Upper East Side",
  upload_url: "http://okirakunoa.cocolog-nifty.com/photos/uncategorized/2010/02/23/pc130755.jpg"
)

create_cafe(
  name: "Cafe Grumpy",
  address: "13 Essex St, New York, NY 10011",
  email: "cafe21@example.com",
  password: "password",
  borough: "Manhattan",
  neighborhood: "Chinatown",
  upload_url: "http://35drsm2kcjyo1uhpn73720ja.wpengine.netdna-cdn.com/wp-content/uploads/2008/06/Cafe-Grumpy-Sign.jpg"
)

create_cafe(
  name: "Stumptown",
  address: "18 W 29th St, New York, NY 10001",
  email: "cafe22@example.com",
  password: "password",
  borough: "Manhattan",
  neighborhood: "Flatiron",
  upload_url: "http://media.oregonlive.com/windowshop/photo/stumptown2jpg-423e1f0cf83b5a6d.jpg"
)

create_cafe(
  name: "The Hungry Ghost",
  address: "183 Sterling Pl, Brooklyn, NY 11238",
  email: "cafe24@example.com",
  password: "password",
  borough: "Brooklyn",
  neighborhood: "Prospect Heights",
  upload_url: "https://c1.staticflickr.com/9/8150/7617695438_b6cc62d144_b.jpg"
)

create_cafe(
  name: "Parlour Coffee",
  address: "84 Havemeyer St, Brooklyn, NY 11211",
  email: "cafe27@example.com",
  password: "password",
  borough: "Brooklyn",
  neighborhood: "Williamsburg",
  upload_url: "https://c1.staticflickr.com/9/8071/8346581574_af10d13f22_b.jpg"
)

create_cafe(
  name: "Milk Bar",
  address: "620 Vanderbilt Ave, Brooklyn, NY 11238",
  email: "cafe28@example.com",
  password: "password",
  borough: "Brooklyn",
  neighborhood: "Prospect Heights",
  upload_url: "http://static1.squarespace.com/static/523760fbe4b0b1ca594cd7d8/523c6dade4b094ec97c93c74/5241d289e4b0c1d14dd7dfe7/1380045451902/milkbar_exterior1_lr.jpg?format=1500w"
)

create_cafe(
  name: "Propeller Coffee",
  address: "984 Manhattan Ave, Brooklyn, NY 11222",
  email: "cafe30@example.com",
  password: "password",
  borough: "Brooklyn",
  neighborhood: "Greenpoint",
  upload_url: "http://onthegrid4.imgix.net/Z-2-3.jpg?auto=format,redeye&dpr=2&w=1129"
)

create_cafe(
  name: "Sweetleaf",
  address: "10-93 Jackson Ave, Queens, NY 11101",
  email: "cafe34@example.com",
  password: "password",
  borough: "Queens",
  neighborhood: "Long Island City",
  upload_url: "http://www.eatthisny.com/wp-content/uploads/2014/04/IMG_1613.jpg"
)

create_cafe(
  name: "Astoria Coffee",
  address: "30-04 30th St, Queens, NY 11102",
  email: "cafe35@example.com",
  password: "password",
  borough: "Queens",
  neighborhood: "Astoria",
  upload_url: "http://s3-media3.fl.yelpcdn.com/bphoto/-jdWMRinwS7hCmWlF_XXwg/o.jpg"
)

# Cafe.all.each do |c|
#   cafe_drinks = drinks.dup
#   (2..7).to_a.sample.times do
#     cafe_drinks = cafe_drinks.shuffle
#     c.menu_items.create(name: cafe_drinks.pop, price: prices.sample)
#   end
# end

# User.all.each do |u|
#   5.times do
#     # redeemed
#     u.redeemed_coffee_gifts.create(giver: User.all.sample, phone: random_phone(), menu_item: MenuItem.all.sample, redeemed: true)
#     # unredeemed
#     u.unredeemed_coffee_gifts.create(giver: User.all.sample, phone: random_phone(), menu_item: MenuItem.all.sample, redeemed: false)
#     # redeemed sent
#     User.all.sample.redeemed_coffee_gifts.create(giver: u, phone: random_phone(), menu_item: MenuItem.all.sample, redeemed: true)
#     # unredeemed sent
#     User.all.sample.redeemed_coffee_gifts.create(giver: u, phone: random_phone(), menu_item: MenuItem.all.sample, redeemed: false)
#   end
# end

# 10.times do
#   CoffeeGift.create(giver: User.all.sample, menu_item: MenuItem.first, redeemed: false, charitable: true)
# end

# kelly = create_user(
#   first_name: "Kelly",
#   last_name: "Ripple",
#   password: "password",
#   email: "kelly.m.ripple@gmail.com",
#   phone: "4438122021",
#   upload_url: "https://media.licdn.com/mpr/mpr/shrinknp_400_400/p/2/005/079/3bf/091d5ee.jpg"
# )
# jerry = User.create(first_name: "Jerry", last_name: "Chai", password: "password", email: "jchai@gmail.com", phone: "5104544544")

# kelly.given_coffees.create(menu_item: MenuItem.find(1), receiver: jerry)
