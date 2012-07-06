namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Product.create!(name: "Example Product",
                 variety: "Single Card",
                 price: 5,
                 desc: "An example product",
                 image: "example.png")
    40.times do |n|
      name  = "Product " + n.to_s
      variety = "Single Card"
      price  = 5
      desc = "An example product"
      image = "example.png"
      Product.create!(name: name,
                   variety: variety,
                   price: price,
                   desc: desc,
                   image: image)
    end
    admin = User.create!(name: "Escher Munro",
                         email: "echer@fake.com",
                         password: "biscuit",
                         password_confirmation: "biscuit")
    admin.toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end