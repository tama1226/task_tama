# 「FactoryBotを使用します」という記述
FactoryBot.define do

    # 作成するテストデータの名前を「task」とします
    # （実際に存在するクラス名と一致するテストデータの名前をつければ、そのクラスのテストデータを自動で作成します）
    factory :task do
      name { 'factory_name_1' }
      content { 'factory_詳細1' }
      priority { '低' }
    end
  
    # 作成するテストデータの名前を「second_task」とします
    # （存在しないクラス名の名前をつける場合、オプションで「このクラスのテストデータにしてください」と指定します）
    factory :second_task, class: Task do
      name {'factory_name_2'}
      content { 'factrory_詳細2'}
      priority { '中' }
    end

    factory :third_task, class: Task do
      name {'factory_name_3'}
      content { 'factrory_詳細3'}
      priority { '高' }
    end
  end