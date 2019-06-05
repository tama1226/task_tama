class TasksController < ApplicationController
  before_action :set_task,only:[:show,:edit,:update,:destroy]

  def index
    @tasks= current_user.tasks
    @tasks= @tasks.page(params[:page]).per(10)
    
      if params[:sort_expired]
        @tasks=@tasks.order(deadline: :desc)
      end

      if params[:sort_priority]
        @tasks=@tasks.order(priority: :asc)
      end
    
      if params[:name].present? 
        @tasks=@tasks.get_by_name params[:name]
      end
      if params[:status].present?
        @tasks=@tasks.get_by_status params[:status]
      end      
  end

  def show
  end

  def new
    @task=Task.new
  end

  def create
    #ログイン中のユーザーのタスク登録
    @task=current_user.tasks.new(task_params)
    label_ids = params[:task][:label_ids]
    
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
    params.require(:task).permit(:name,:content,:deadline,:status,:priority,:label_ids)
  end

  def set_task
    @task=current_user.tasks.find(params[:id])
  end
end
