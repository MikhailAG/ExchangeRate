class AddCreatedAtToCurrencies < ActiveRecord::Migration[7.0]
  def change
    add_timestamps :currencies, null: false, default: -> { 'NOW()' }
  end
end
