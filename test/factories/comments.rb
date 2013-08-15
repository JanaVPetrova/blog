FactoryGirl.define do
  factory 'post/comment' do
    body { generate :string }
    association :post, factory: :post
    association :user, factory: :user
  end
end