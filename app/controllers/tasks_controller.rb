class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  # /tasks
  def index
    @tasks = Task.all
  end

  # /tasks/:id
  def show; end

  # /tasks/new
  def new
    @task = Task.new
  end

  # /tasks
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # /tasks/:id/edit
  def edit; end

  # /tasks/:id
  def update
    if @task.update(task_params)
      redirect_to tasks_path
    else
       render :new, status: :unprocessable_entity
    end
  end

  # /tasks/:id
  def destroy
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end


  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
