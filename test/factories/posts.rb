FactoryGirl.define do
  factory :post do
    title { generate :string }
    text { generate :string }
    subject
  end
end