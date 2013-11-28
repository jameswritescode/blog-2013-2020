# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title   Faker::Lorem.words(8).join(' ')
    content Faker::Lorem.paragraphs.join
    slug    Faker::Lorem.words(8).join(' ').parameterize
  end
end
