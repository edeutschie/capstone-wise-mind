class AddDateUsedColumnToQuotes < ActiveRecord::Migration[5.0]
  def change
    add_column :quotes, :date_used, :date
  end
end
