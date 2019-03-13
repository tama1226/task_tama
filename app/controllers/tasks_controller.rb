class TasksController < ApplicationController
  before_action :set_task,only:[:show,:edit,:update,:destroy]

  def index
    @tasks=Task.all
  end

  def show
  end

  def new
    @task=Task.new
  end

  def create
    @task=Task.new(task_params)
    @task.save!
    redirect_to tasks_url, notice: "タスクの登録が完了しました！"
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
    params.require(:task).permit(:name,:content)
  end

  def set_task
    @task=Task.find(params[:id])
  end
end
