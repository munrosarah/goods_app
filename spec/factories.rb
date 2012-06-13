FactoryGirl.define do
  factory :product do
    name    "Example Product"
    variety "Example Type"
    price   5.50
    desc    "Example description"
    image   "example.png"
    thumbnail "examplethumb.png"
  end
end
