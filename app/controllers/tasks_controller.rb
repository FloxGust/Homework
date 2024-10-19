class TasksController < ApplicationController
    def index
      @incomplete_tasks = Task.where(status: :incomplete)
      @completed_tasks = Task.where(status: :complete)
      @task = Task.new
    end
  
    def create
      @task = Task.new(task_params)
      @task.status = :incomplete
      if @task.save
        redirect_to category_tasks_path(@task.category), notice: 'Task created successfully.'
      else
        render :index
      end
    end
  
    def complete
      @task = Task.find(params[:id])
      @task.update(status: :complete)
      redirect_to tasks_path, notice: 'Task marked as complete.'
    end
  
    def destroy
      @task = Task.find(params[:id])
      @task.destroy
      redirect_to tasks_path, notice: 'Task deleted successfully.'
    end
    
    def edit
      @task = Task.find(params[:id])
    end
    
    def update
      @task = Task.find(params[:id])
      if @task.update(task_params)
        redirect_to category_tasks_path(@task.category), notice: 'Task updated successfully.'
      else
        render :edit
      end
    end
    
    private

    def task_params
      params.require(:task).permit(:name, :category_id)
    end
end
