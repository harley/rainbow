module ItemsHelper
  def searched_item_facets
    Item.facet_fields.select{|field| params[field]}
  end
end
