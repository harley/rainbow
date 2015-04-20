module ItemsHelper
  def searched_item_facets
    Item.facet_fields.select{|field| params[field]}
  end

  def query_params
    params.except(:action, :controller)
  end
end
