class UpdateCurrenciesCreatedAt < ActiveRecord::Migration[7.0]
  def change
    if column_exists?(:currencies, :created_at)
      change_column_default :currencies, :created_at, -> { 'NOW()' }
      change_column_null :currencies, :created_at, false
    else
      add_column :currencies, :created_at, :datetime, null: false, default: -> { 'NOW()' }
    end
  end
end
