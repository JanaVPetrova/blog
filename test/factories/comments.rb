FactoryGirl.define do
  factory :comment do
    commenter { generate :string }
    body { generate :string }
    association :post, factory: :post
  end
end