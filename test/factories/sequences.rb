FactoryGirl.define do
  sequence :string do |n|
    "string-#{n}"
  end
end