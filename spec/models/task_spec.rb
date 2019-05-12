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

  describe "scopeに関するテスト" do
    let!(:task) { Task.new(name: "aaabbb", status: "") }
    subject { Task.get_by_name }
    it { is_expected.to include task }
  end



  #it "モデルに作成したscopeを使用し、タスク名による検索ができる" do
    #task = Task.new(name: "aaabbb", content: "タイトルによる検索", deadline: '2019-05-12T12:30:45', status: '未着手')
    #task.save
    #expect_task_title = Task.where(name: "aaabbb").first.name
    #search_title = Task.get_by_name(@search_params).first.name
    #expect(search_title).to eq expect_task_title
  #end

  #it "モデルに作成したscopeを使ってステータスによる検索ができる" do
    #task = User.first.tasks.build(title: "aaabbb", summary: "タイトルけんさく", limit: '2019-04-17T12:30:45', status: '未着手')
    #task.save
    #expect_task_status = Task.where(status: "未着手").first.status
    #search_status = Task.search_with_status(@search_params).first.status
    #expect(search_status).to eq expect_task_status
  #end

  #it "モデルに作成したscopeを使ってタイトルとステータスによる検索ができる" do
    #task = User.first.tasks.build(title: "aaabbb", summary: "タイトルけんさく", limit: '2019-04-17T12:30:45', status: '未着手')
    #task.save
    #expect_task_title = Task.where(title: "aaabbb").first.title
    #search_title = Task.search_with_title(@search_params).first.title
    #expect_task_status = Task.where(status: "未着手").first.status
    #search_status = Task.search_with_title_and_status(@search_params).first.status
    #expect(search_title).to eq expect_task_title
    #expect(search_status).to eq expect_task_status
  #end

end