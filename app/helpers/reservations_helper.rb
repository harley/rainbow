module ReservationsHelper
  def reservation_link(name, status, url, options = {})
    options[:class] = "btn btn-lg btn-block reservation-#{status}"
    options[:data] = {disable_with: "Please wait..."}
    link_to name, url, options
  end

  def reservation_button(name, status, options = {})
    options[:class] = "btn btn-lg btn-block reservation-#{status}"
    options[:data] = {disable_with: "Please wait..."}
    button_tag name, options
  end
end
