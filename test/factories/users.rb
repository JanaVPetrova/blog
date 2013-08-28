FactoryGirl.define do
  factory :user do
    login { generate :string }
    password { generate :string }
    email { generate :email }
  end

  factory :owner, parent: :user do
    login { configus.owner.login }
    password { configus.owner.password }
    email { configus.owner.email }
  end
end