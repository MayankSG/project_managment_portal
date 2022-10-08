class TasksController < ApplicationController
  before_action :set_project, except: [:create, :update]
  before_action :set_task , only: [:show, :edit, :update, :destroy]

  def index
    @tasks = @project.tasks
  end

  def show;end

  def new
    @task = Task.new
  end

  def edit;end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to task_path(project_id: @task.project_id, id: @task.id), notice: 'Task was sucessfully created'
    else
      render :new
    end

  end

  def update
    if @task.update(task_params)
      redirect_to task_path(project_id: @task.project_id), notice: 'Task was sucessfully updated'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to project_url(@project), status: :see_other, notice: 'Task was successfully destroyed'
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :status, :reporter_id, :assignee_id, :project_id)
  end

end
