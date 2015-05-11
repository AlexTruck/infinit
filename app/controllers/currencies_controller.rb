class CurrenciesController < ApplicationController

  def index
    @currencies = Currency.where("created_at >= ?", Time.now.beginning_of_hour)
  end

  def show
    @currency = Currency.find(params[:id])
  end
end