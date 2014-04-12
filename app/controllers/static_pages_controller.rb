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
    @tasks = @user.tasks.reject(&:new_record?)
    @task = @user.tasks.build if user_signed_in?
  end

end
