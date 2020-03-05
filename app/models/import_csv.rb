class ImportCsv < ApplicationRecord
  # CSVデータのパスを引数として受け取り、インポート処理を実行
  def self.movies_data
    path = File.join Rails.root, "db/csv/movie_data.csv"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
          title: row["title"],
          url: row["url"]
    }
    end
    puts "インポート処理を開始"
    begin
      Movie.create!(list)
      puts "インポート完了！！"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "インポートに失敗:UnknownAttributeError"
    end
  end
end