class CreateQuoteUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :quote_users do |t|
      t.belongs_to :quote, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
