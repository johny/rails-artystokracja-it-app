class QuotesController < ApplicationController

  def random
    @quote = Quote.last
  end

  def index
    @quotes = Quote.all
  end

  def show
    @quote = Quote.find params[:id]
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new quote_params
    if @quote.save
      redirect_to root_path
    else
      render action: 'new'
    end
  end

end
