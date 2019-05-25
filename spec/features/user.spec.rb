require 'rails_helper'

# このRSpec.featureの右側に、「タスク管理機能」のように、テスト項目の名称を書きます（do ~ endでグループ化されています）
RSpec.feature "ユーザーテスト機能", type: :feature do
  # scenario（itのalias）の中に、確認したい各項目のテストの処理を書きます。
  background do
  # あらかじめタスク一覧のテストで使用するためのタスクを二つ作成する
  @user1=FactoryBot.create(:user)
  end

  scenario "バリデーション" do
  
  end

end