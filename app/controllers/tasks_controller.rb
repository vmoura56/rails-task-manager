class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "Task successfully created"
      redirect_to @task
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
      if @task.update_attributes(task_params)
        flash[:success] = "Task was successfully updated"
        redirect_to @task
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      flash[:success] = 'Task was successfully deleted.'
      redirect_to tasks_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to tasks_path
    end
  end
  
  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
