class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @projects = @user.projects.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @user = current_user
    @project = @user.projects.build
  end

  def create
    @user = current_user
    @project = @user.projects.build(project_params)
    if @project.save
      flash[:success] = "プロジェクトを作成しました"
      redirect_to projects_url
    else
      render "projects/new"
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash[:success] = "プロジェクトを更新しました"
      redirect_to projects_url
    else
      render "projects/edit"
    end
  end

  def destroy
    Project.find(params).destroy
    flash[:success] = "プロジェクトを削除しました"
    redirect_to projects_url
  end

  private
    def project_params
      params.require(:project).permit(:name, :description, :color_id)
    end
end
