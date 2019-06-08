require 'rails_helper'

RSpec.feature "ラベル管理機能", type: :feature do

  background do
  # あらかじめタスク一覧のテストで使用するためのユーザーを作成する
  FactoryBot.create(:user)
  FactoryBot.create(:label)
  end

  before do
  #ログイン画面から、まずはログイン
    visit new_session_path

    fill_in 'Email', with: 'DIC@dic.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end

  scenario "タスク登録時にラベル設定可能かのテスト" do
    visit new_task_path

    fill_in 'タスク名', with: 'タスク１'
    fill_in '詳細', with: '内容1'
    check 'task_label_ids_1'

    click_button '登録する'
    visit "/tasks/1"

    expect(page).to have_content '詳細'
    expect(page).to have_content 'ラベル番号'
    expect(page).to have_content 'ラベル名'
  end

  scenario "ラベルで検索可能かのテスト" do
    visit new_task_path

    fill_in 'タスク名', with: 'タスク2'
    fill_in '詳細', with: '内容2'
    check 'task_label_ids_2'

    click_button '登録する'
    visit "/tasks/2"

    visit tasks_path

    select 'ラベル', from: 'label_id'
    click_on '検索'

    expect(page).to have_content "タスク一覧"
    expect(page).to have_content "タスク2" 
  end


end