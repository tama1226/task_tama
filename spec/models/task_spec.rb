require 'rails_helper'

RSpec.describe Task, type: :model do
  
  it "nameが空ならバリデーションが通らない" do
    task = Task.new(name: '', content: '詳細')
    expect(task).not_to be_valid
  end

  it "contentが空ならバリデーションが通らない" do
    task = Task.new(name: '名前', content: '')
    expect(task).not_to be_valid
  end

  it "nameとcontentに内容が記載されていればバリデーションが通る" do
    task = Task.new(name: '名前', content: '詳細')
    expect(task).to be_valid
  end

  it "モデルに作成したscopeを使用し、タスク名による検索ができる" do
    task = Task.new(name: "aaabbb", content: "タイトルによる検索", deadline: '2019-05-12T12:30:45', status: '未着手')
    task.save
    expect_task_name = Task.where(name: "aaabbb").first.name
    search_name = Task.get_by_name(params[:name]).first.name
    expect(search_name).to eq expect_task_name
  end
  
  it "モデルに作成したscopeを使用し、statusによる検索ができる" do
    task = Task.new(name: "aaabbb", content: "タイトルによる検索", deadline: '2019-05-12T12:30:45', status: '未着手')
    task.save
    expect_task_status = Task.where(status: "未着手").first.status
    search_status = Task.get_by_status(params[:status]).first.status
    expect(search_status).to eq expect_task_status
  end

end