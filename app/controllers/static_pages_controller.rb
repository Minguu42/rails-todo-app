class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @user = current_user
      @projects = @user.projects
    else
      @projects = Project.all
    end
  end
end
