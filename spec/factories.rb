FactoryGirl.define do
  factory :product do
    sequence(:name) { |n| "Product #{n}" }
    variety "Single Card"
    price   5.50
    desc    "Example description"
    image   "example.png"
  end
end
