class AddTimestampsToCurrencies < ActiveRecord::Migration[6.0]
  def change
    add_timestamps :currencies, null: true
  end
end