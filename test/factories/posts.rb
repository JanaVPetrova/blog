FactoryGirl.define do
  factory :post do
    title { generate :string }
    text { generate :string }
    association :user, factory: :user
  end
end