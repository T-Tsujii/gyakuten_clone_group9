class CreateTexts < ActiveRecord::Migration[6.0]
  def change
    create_table :texts do |t|
    #csv投入用カラム作成
      t.string :genre
      t.string :title
      t.string :content
      t.timestamps
    end
  end
end
