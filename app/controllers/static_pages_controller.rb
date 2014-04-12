class StaticPagesController < ApplicationController
  def home
  	if user_signed_in?
  		redirect_to profile_path
  	end
  end

  def help
  end

  def about
  end

  def profile
  	@user = current_user
  end

end
