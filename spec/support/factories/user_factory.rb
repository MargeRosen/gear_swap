FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@gearswap.com"}
    password "password"
    password_confirmation "password"
  end
end
