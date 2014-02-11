# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :metric do
    association :post, factory: :post
  end
end
