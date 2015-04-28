FactoryGirl.define do
  factory :user do
    sequence(:username) { |i| "testuser#{i}" }
    sequence(:email) { |i| "testuser#{i}@gmail.com" }
    password 'test123.com'
    password_confirmation 'test123.com'
  end
end