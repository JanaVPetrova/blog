FactoryGirl.define do
  factory :user do
    login { generate :string }
    password { generate :string }
  end
end