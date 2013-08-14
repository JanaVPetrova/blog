FactoryGirl.define do
  factory :user do
    login { generate :string }
    password { generate :string }
  end

  factory :owner, parent: :user do
    login "owner"
    password "owner"
  end
end