require 'spec_helper'

describe User do
  before { @user = User.new(username: "test1", email: "test1@example.com", 
  				password: "12345678", password_confirmation: "12345678") }

  subject { @user }

  it { should respond_to(:username) }
  it { should respond_to(:email) }
  it { should respond_to(:relationships) }
  it { should respond_to(:reverse_relationships) }
  it { should respond_to(:followers) }
  it { should respond_to(:followed_users) }
  it { should respond_to(:following?) }
  it { should respond_to(:follow!) }

end
