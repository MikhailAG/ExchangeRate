class Currency < ApplicationRecord
  self.ignored_columns = %w[created_at updated_at]
  has_many :options, -> { order 'created_at asc' }
  def self.last_updated_at
    maximum(:updated_at)
  end
end
