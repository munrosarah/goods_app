namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Product.create!(name: "Example Product",
                 variety: "Single Card",
                 price: 5,
                 desc: "An example product",
                 image: "example.png")
    99.times do |n|
      name  = Faker::Name.name
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
  end
end