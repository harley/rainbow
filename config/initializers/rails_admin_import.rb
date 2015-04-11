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

  config.model User do
    excluded_fields do
      [
       :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at,
       :sign_in_count, :current_sign_in_at, :current_sign_in_ip, :last_sign_in_at, :last_sign_in_ip,
       :added_item
      ]
    end
  end

  config.model Member do
    excluded_fields do
      []
    end
    label :sid
  end
end
