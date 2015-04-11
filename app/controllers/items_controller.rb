class ItemsController < ApplicationController
  def index
    @search = Item.search do
      fulltext params[:search]
    end

    @items = @search.results
  end
end
