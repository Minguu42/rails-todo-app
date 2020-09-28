class TasksController < ApplicationController

  def create
    @project = Project.find(params[:task][:project_id])
    @task = @project.tasks.build(task_params)
    if @task.save
      flash[:success] = "タスクを作成しました"
      redirect_to project_url(@project.id)
    else
      render 'projects/show'
    end
  end

  def destroy
  end

  private

    def task_params
      params.require(:task).permit(:name)
    end
end
