# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email    "alicebob@example.com"
    password "please"
    password_confirmation "please"
  end
end
