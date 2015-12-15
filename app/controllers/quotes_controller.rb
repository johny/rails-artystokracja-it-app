class QuotesController < ApplicationController

  def index
    @quote = Quote.random
  end

  def show
    @quote = Quote.published.find params[:id]
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new quote_params
    @quote.published = false

    if @quote.save
      redirect_to root_path, notice: 'Zgłoszenie przesłane do weryfikacji. Dziękujemy!'
    else
      flash.now[:error] = 'Sprawdź poprawność formularza i spróbuj ponownie!'
      render action: 'new'
    end
  end

  private

    def quote_params
      params.require(:quote).permit(:content)
    end

end
