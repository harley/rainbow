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

  def notes_indicator(reservation, method)
    notes = reservation.send(method)
    if notes.present?
      content_tag :span, '', class: 'glyphicon glyphicon-question-sign', data: {toggle: 'popover', content: notes, placement: 'top'}, title: method.to_s.humanize, style: "cursor:pointer;top:3px"
    end
  end
end
