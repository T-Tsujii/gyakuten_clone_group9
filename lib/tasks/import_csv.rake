require 'csv'

# 名前空間 => import
namespace :import_csv do
  # タスクの説明
  desc "CSVデータをインポートするタスク"

  # タスク名 => users
  task questions: :environment do
    # インポートするファイルのパスを取得
    path = File.join Rails.root, "db/csv_data/question_data.csv"
    # インポートするデータを格納するための配列
    list = []
    # CSVファイルからインポートするデータを取得し配列に格納
    CSV.foreach(path, headers: true) do |row|
      list << {
          title: row["title"],
          detail: row["detail"]
      }
    end
    puts "インポート処理を開始"
    # インポートができなかった場合の例外処理
    begin
      Question.create!(list)
      puts "インポート完了!!"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "インポートに失敗：UnknownAttributeError"
    end
  end

end
