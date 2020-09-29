class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @user = current_user
      @projects = @user.projects.page(params[:page]).per(10)
    else
      @projects = Project.all.page(params[:page]).per(10)
    end
  end
end
