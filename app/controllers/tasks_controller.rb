class TasksController < ApplicationController

  def create
    @project = Project.find(params[:task][:project_id])
    @task = @project.tasks.build(task_params)
    if @task.save
      flash[:success] = 'タスクを作成しました'
      redirect_to project_url(@project.id)
    else
      render 'projects/show'
    end
  end

  def destroy
    Task.find(params[:id]).destroy
    flash[:success] = 'タスクを削除しました'
    redirect_back(fallback_location: root_url)
  end

  private

    def task_params
      params.require(:task).permit(:name)
    end
end
