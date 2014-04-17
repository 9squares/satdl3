FactoryGirl.define do
	factory :user do
		username    "test1"
		email       "test1@example.com"
		password    "12345678"
		password_confirmation "12345678"
	end
end