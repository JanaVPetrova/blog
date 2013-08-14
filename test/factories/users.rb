FactoryGirl.define do
  factory :user do
    login { generate :string }
    password { generate :string }
  end

  factory :owner, parent: :user do
    login { configus.owner.login }
    password { configus.owner.password }
  end
end