class ChangeUpdatedAtNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null :currencies, :updated_at, true
  end
end
