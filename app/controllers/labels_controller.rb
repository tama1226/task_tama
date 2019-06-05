class LabelsController < ApplicationController
  def create
    @label = Label.new(label_params)
    @label.save
    redirect_to admin_users_path, notice: "ラベルを登録"
  end
    
  def destroy
    @label = Label.find(params[:id])
    @label.destroy
    redirect_to admin_users_path, notice: "ラベルを削除"
  end
    
  private
    
  def label_params
    params.require(:label).permit(:name)
  end
end
