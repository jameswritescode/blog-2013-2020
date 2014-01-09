# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attachment do
    attachment { File.open(Rails.root.join('spec', 'support', 'murray.jpeg')) }
  end
end
