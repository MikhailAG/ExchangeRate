class AddTimestampsToCurrencies < ActiveRecord::Migration[7.0]
  def change
    add_column :currencies, :created_at, :datetime
    add_index :currencies, :created_at
    add_column :currencies, :updated_at, :datetime
    add_index :currencies, :updated_at
  end
end
