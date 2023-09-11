class UpdateCurrency
  include Sidekiq::Worker

  def perform(*args)
    response = RestClient.get 'https://openexchangerates.org/api/latest.json?app_id=656dbffe8f3a4ebea2dd16933c192aac'
    rates = JSON.parse(response.body)['rates']
    date = Date.today

    rates.each do |name, value|
      currency = Currency.find_or_create_by(name: name, date: date)
      currency.value = value
      currency.save!
    end
  end

  UpdateCurrency.perform_in(Time.now + 5.seconds)
end