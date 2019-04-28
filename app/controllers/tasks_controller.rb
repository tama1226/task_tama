class TasksController < ApplicationController
  before_action :set_task,only:[:show,:edit,:update,:destroy]

  def index
    @tasks=Task.all.order(params[:sort_expired])
    binding.pry
      if params[:sort_expired].present?
        Task.all.order(deadline: :desc)
      else
        Task.all.order(created_at: :desc)
      end
  end

  def show
  end

  def new
    @task=Task.new
  end

  def create
    @task=Task.new(task_params)
    
    if @task.save
      redirect_to tasks_url, notice: "タスクの登録が完了しました！"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @task.update!(task_params)
    redirect_to tasks_url, notice: "タスクを更新しました！"
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: "タスクを削除しました！"
  end
  

  private
  
  def task_params
    params.require(:task).permit(:name,:content,:deadline)
  end

  def set_task
    @task=Task.find(params[:id])
  end
end
