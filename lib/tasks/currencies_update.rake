namespace :currencies do
  task update: :environment do
    CurrenciesUpdateJob.perform_now
  end
end