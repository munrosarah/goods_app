FactoryGirl.define do
  factory :product do
    sequence(:name) { |n| "Product #{n}" }
    variety "Single Card"
    price   5.50
    desc    "Example description"
    image   "example.png"
  end
  
  factory :user  do
    name      "Escher Munro"
    email     "escher@fake.com"
    password  "foobar"
    password_confirmation "foobar"
    
  end
end
