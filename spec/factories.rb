FactoryGirl.define do 
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}   
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end
  
  factory :product do
    sequence(:name) { |n| "Product #{n}" }
    variety "Single Card"
    price   5.50
    desc    "Example description"
    image   "example.png"
    user
  end
end
