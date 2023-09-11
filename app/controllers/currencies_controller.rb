class CurrenciesController < ApplicationController
  def new
    @currency = Currency.new
  end

  def upload
    UpdateCurrency.perform_async
  end

  def create
    @currency = Currency.new(currency_params)

    if @currency.save
      redirect_to currencies_path
    else
      render 'new'
    end
  end

  def index
    @currencies = Currency.all
  end

  private

  def currency_params
    params.require(:currency).permit(:name, :value, :date)
  end
end