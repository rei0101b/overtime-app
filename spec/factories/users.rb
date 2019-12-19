FactoryGirl.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :user do
    first_name "Jon"
    last_name "Snow"
    email { generate :email }
    password "passwords"
    password_confirmation "passwords"
  end

  factory :admin_user, class: "AdminUser" do
    first_name "Admin"
    last_name "Snow"
    email { generate :email }
    password "admin_passwords"
    password_confirmation "admin_passwords"
  end
end