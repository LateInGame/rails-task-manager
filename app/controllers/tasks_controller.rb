class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new # Needed to instantiate the form_with
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    @task.save # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params) # Will raise ActiveModel::ForbiddenAttributesError
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
