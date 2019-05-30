require 'rails_helper'

RSpec.feature "ユーザーテスト機能", type: :feature do

  background do
  # あらかじめタスク一覧のテストで使用するためのユーザーを作成する
  @user1=FactoryBot.create(:user)
  end

  before do
  #ログイン画面から、まずはログイン
    visit new_session_path

    fill_in 'Email', with: 'DIC@dic.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end

  scenario "ユーザー一覧のテスト" do
    visit admin_users_path

    expect(page).to have_content 'DIC'
  end

  scenario "ユーザー作成のテスト" do
    visit admin_users_path

    click_on '新規ユーザー登録'

    fill_in 'Name',with:'User'
    fill_in 'Email',with:'user@user.com'
    fill_in 'Password',with:'user'
    fill_in 'Password confirmation',with:'user'

    expect(page).to have_content 'User'
  end

  scenario "ユーザー詳細のテスト" do
    visit admin_users_path

    click_on '詳細画面'

    expect(page).to have_content 'DIC'
  end

  scenario "ユーザー詳細のテスト" do
    visit admin_users_path

    click_on '詳細画面'

    expect(page).to have_content 'DIC'
  end

end