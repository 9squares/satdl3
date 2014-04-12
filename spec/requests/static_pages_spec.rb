require 'spec_helper'

describe "StaticPages" do
	subject { page }

	describe "Home Page" do
		before { visit root_path }

		it { should have_content('Home Page') }
	end

	describe "Sign Up Page" do
		before { visit new_user_registration_path }

		it { should have_content('Sign up')}
	end

	describe "Sign In Page" do
		before { visit new_user_session_path }

		it { should have_content('Sign in') }
		it { should have_link('Home') }
	end

	describe "Profile Page" do
		before { visit profile_path }

		it { should have_content('Profile Page') }
	end

end
