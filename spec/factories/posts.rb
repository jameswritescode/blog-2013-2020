# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title     { FFaker::Lorem.words(8).join(' ') }
    content   { FFaker::Lorem.paragraphs.join }
    slug      { FFaker::Lorem.words(8).join(' ').parameterize }
  end
end
