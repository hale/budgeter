# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :transaction do
    description "MyText"
    date "2013-06-27 22:05:13"
    direction "MyString"
    amount ""
  end
end
