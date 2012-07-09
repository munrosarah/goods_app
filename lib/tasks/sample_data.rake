namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Escher Munro",
                         email: "escher@fake.com",
                         password: "biscuit",
                         password_confirmation: "biscuit")
    admin.toggle!(:admin)
    30.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    users = User.all(limit:6)
    20.times do |n|
      users.each { |user| user.products.create!(name: user.name + " Product " + n.to_s,
                                                variety: "Single Card",
                                                price: 5,
                                                desc: "An example product",
                                                image: "example.png")}
    end
  end
end