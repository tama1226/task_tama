# このrequireで、Capybaraなどの、Feature Specに必要な機能を使用可能な状態にしています
require 'rails_helper'

# このRSpec.featureの右側に、「タスク管理機能」のように、テスト項目の名称を書きます（do ~ endでグループ化されています）
RSpec.feature "タスク管理機能", type: :feature do
  # scenario（itのalias）の中に、確認したい各項目のテストの処理を書きます。
  background do
  # あらかじめタスク一覧のテストで使用するためのタスクを二つ作成する
  FactoryBot.create(:task)
  FactoryBot.create(:second_task)
  end
end

  scenario "タスク一覧のテスト" do
  # tasks_pathにvisitする（タスク一覧ページに遷移する）
    visit tasks_path

  # visitした（到着した）expect(page)に（タスク一覧ページに）「testtesttest」「samplesample」という文字列が
  # have_contentされているか？（含まれているか？）ということをexpectする（確認・期待する）テストを書いている
    expect(page).to have_content 'testtesttest'
    expect(page).to have_content 'samplesample'
  end

  scenario "タスク作成のテスト" do
    # new_task_pathにvisitする（タスク登録ページに遷移する）
  # 1.ここにnew_task_pathにvisitする処理を書く
    visit new_task_path

  # 「タスク名」というラベル名の入力欄と、「タスク詳細」というラベル名の入力欄に
  # タスクのタイトルと内容をそれぞれfill_in（入力）する
  # 2.ここに「タスク名」というラベル名の入力欄に内容をfill_in（入力）する処理を書く
    fill_in 'タスク名',with:'work'

  # 3.ここに「タスク詳細」というラベル名の入力欄に内容をfill_in（入力）する処理を書く
    fill_in '詳細',with:'practice'

  # 「登録する」というvalue（表記文字）のあるボタンをclick_onする（クリックする）
  # 4.「登録する」というvalue（表記文字）のあるボタンをclick_onする（クリックする）する処理を書く
    click_on '登録する'

  # clickで登録されたはずの情報が、タスク詳細ページに表示されているかを確認する
  # （タスクが登録されたらタスク詳細画面に遷移されるという前提）
  # 5.タスク詳細ページに、テストコードで作成したはずのデータ（記述）がhave_contentされているか（含まれているか）を確認（期待）するコードを書く
    expect(page).to have_content 'work' 
    expect(page).to have_content 'practice'
  end

  scenario "タスク詳細のテスト" do
  # あらかじめタスク詳細のテストで使用するためのタスクを仮作成
    task = Task.create!(name: 'test_task_03', content: 'test3')

  # タスク詳細ページに遷移
    visit task_path(task[:id])

  # visitした（到着した）expect(page)に（タスク詳細ページに）「test_task_03」「test3」という文字列が
  # have_contentされているか？（含まれているか？）ということをexpectする（確認・期待する）テスト
  # 詳細ページに遷移したことを確認したいので「各タスク詳細画面」という文字列の含みも確認
    expect(page).to have_content '各タスク詳細画面'
    expect(page).to have_content 'test_task_03'
    expect(page).to have_content 'test3'
  end

  scenario "タスクが作成日時の降順に並んでいるかのテスト" do
  #タスクが作成日時の降順に並んでいる
    Task.all.order(created_at: :desc)
  
  end
end