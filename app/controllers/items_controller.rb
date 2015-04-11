class ItemsController < ApplicationController
  def index
    @search = Item.search do
      fulltext params[:search]
      order_by(:created_at, :desc)
    end

    @items = @search.results
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new item_params
    if @item.save
      redirect_to items_path
    else
      render action: 'new'
    end
  end

  def edit
    @item = Item.find params[:id]
  end

  def update
    @item = Item.find params[:id]
    if @item.update_attributes item_params
      redirect_to items_path
    else
      render action: 'edit'
    end
  end

  def show
    @item = Item.find params[:id]
  end

  private

  def item_params
    params.require(:item).permit!
  end
end
