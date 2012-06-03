# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email    "alice@example.com"
    password "please"
    password_confirmation "please"
  end
end
