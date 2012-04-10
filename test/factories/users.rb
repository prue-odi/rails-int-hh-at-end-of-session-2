# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  sequence :email do |n|
    "info#{n}@eficode.com"
  end

  factory :user do
    email
    password 'infopass'
  end

end
