class TasksController < ApplicationController
  before_action :set_task,only:[:show,:edit,:update,:destroy]

  

  def index
    @tasks=Task.page(params[:page])
    
      if params[:sort_expired]
        @task=Task.all.order(deadline: :desc)
      else
        @task=Task.all
      end

      if params[:sort_priority]
        @task=Task.all.order(priority: :asc)
      else
        @task=Task.all
      end

      if params[:name].present? 
        @task=@task.get_by_name params[:name]
      end
      if params[:status].present?
        @task=@task.get_by_status params[:status]
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
    params.require(:task).permit(:name,:content,:deadline,:status,:priority)
  end

  def set_task
    @task=Task.find(params[:id])
  end
end
