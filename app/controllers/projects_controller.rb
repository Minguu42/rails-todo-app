class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = "プロジェクトを作成しました"
      redirect_to projects_url
    else
      render "projects/new"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def project_params
      params.require(:project).permit(:name, :description, :color_id)
    end
end
