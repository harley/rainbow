class ItemsController < ApplicationController
  before_filter :authenticate_user!, only: [:added_by_me]

  def added_by_me
    @items = current_user.added_items
  end

  def index
    @search = Item.search do
      fulltext params[:search]
      order_by(:created_at, :desc)
      Item.facet_fields.each do |field|
        facet(field)
        with(field, params[field]) if params[field].present?
      end
    end

    @items = @search.results
  end

  def new
    @item = Item.new
    authorize @item
  end

  def create
    @item = Item.new item_params
    if @item.save
      redirect_to @item
    else
      render action: 'new'
    end
  end

  def edit
    @item = Item.find params[:id]
    authorize @item
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
