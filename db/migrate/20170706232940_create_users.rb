class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :phone_num
      t.string :email
      t.string :theme_choice

      t.timestamps
    end
  end
end
