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

  describe "get_by_nameがきちんとscopeとして使えるか" do
    let!(:scope_task) { Task.create(name: 'タスク1',content: '内容1',status: '未着手') }
    subject { Task.get_by_name('タスク1') }
    it { is_expected.to include scope_task }
  end

  describe "get_by_statusがきちんとscopeとして使えるか" do
    let!(:scope_task) { Task.create(name: 'タスク1',content: '内容1',status: '未着手') }
    subject { Task.get_by_status('未着手') }
    it { is_expected.to include scope_task}
  end

end