class AddCreatedAtToCurrencies < ActiveRecord::Migration[7.0]
  def change
    add_column :currencies, :created_at, :datetime
  end
end
