FactoryGirl.define do
  sequence :string do |n|
    "string-#{n}"
  end

  sequence :email do |n|
    "email#{n}@server.com"
  end
end