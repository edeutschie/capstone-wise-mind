class CreateQuotes < ActiveRecord::Migration[5.0]
  def change
    create_table :quotes do |t|
      t.text :text
      t.string :author
      t.string :theme
      t.boolean :public
      t.belongs_to :user

      t.timestamps
    end
  end
end
