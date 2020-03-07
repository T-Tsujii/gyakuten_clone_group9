class ImportCsv < ApplicationRecord
  # CSVデータのパスを引数として受け取り、インポート処理を実行
  def self.import(path)
    CSV.foreach(path, headers: true) do |row|
      Movie.create(
          title: row["title"],
          url: row["url"]
      )
    end
  end
end