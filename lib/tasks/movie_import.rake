require 'csv'

namespace :movie_import do
  desc "動画情報をインポートする"
  task movies: :environment do
      def self.import(path)
      CSV.foreach(path, headers: true) do |row|
      Movie.create(
          title: row["title"],
          url: row["url"]
      )  
      end
    end
  end
end
