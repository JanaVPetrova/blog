FactoryGirl.define do
  factory :user do
    login { generate :string }
    password { generate :string }
  end

  factory :owner, class: User do
    login "owner"
    password "owner"
  end
end