FactoryGirl.define do
  factory :house_number do
    changeset 4321
    latitude -33.654321
    longitude -70.987654
    value "736"

    user
  end
end
