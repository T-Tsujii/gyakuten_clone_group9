require 'csv'

namespace :import_csv do
  desc "CSVデータインポート"

  task texts: :environment do
  # インポートするファイルパス
  path = File.join Rails.root, "db/csv_data/text_data.csv"
  list = []
  CSV.foreach(path, headers: true) do |row|
    list << {
      genre: row["genre"],
      title: row["title"],
      content: row["content"]
    }
  end
  puts "インポート処理を開始".blue
  # インポートができなかった場合
  begin
    Text.create!(list)
    puts "インポート完了!!".green
  rescue ActiveModel::UnknownAttributeError => invalid
    puts "インポートに失敗：UnknownAttributeError".red
  end
end
end
