RailsAdminImport.config do |config|
  config.model Item do
    excluded_fields do
      [:filepicker_url]
    end
    # label :title
    # extra_fields do
    #   [:field3, :field4, :field5]
    # end
  end
end
