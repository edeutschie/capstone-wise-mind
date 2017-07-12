class CreateDailyQuotes < ActiveRecord::Migration[5.0]
  def change
    create_table :daily_quotes do |t|
      t.date :date_used
      t.string :theme
      t.belongs_to :quote

      t.timestamps
    end
  end
end
