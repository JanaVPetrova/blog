FactoryGirl.define do
  factory :comment do
    commenter { generate :string }
    body { generate :string }
  end
end