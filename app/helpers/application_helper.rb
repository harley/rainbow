module ApplicationHelper
  def flasherize key
    case key
    when 'notice'
      'alert-info'
    when 'error'
      'alert-danger'
    when 'alert'
      'alert-warning'
    else
      "alert-#{key}"
    end
  end

  def time_vs_now(a)
    if a
      content_tag :span, title: a, data: {utime: a.to_i} do
        if a > Time.zone.now
          time_ago_in_words(a) + ' from now'
        else
          time_ago_in_words(a) + ' ago'
        end
      end
    end
  end
  # def markdown(text)
  #   Kramdown::Document.new(text).to_html.html_safe
  # end

  # override kaminari helper to support sunspot
  def page_entries_info(collection, options = {})
    collection_name = options[:collection_name] || (collection.empty?? 'entry' : collection.first.class.name.underscore.sub('_', ' '))

    if collection.num_pages < 2
      case collection.size
      when 0; info = "No #{collection_name.pluralize} found"
      when 1; info = "Displaying <strong>1</strong> #{collection_name}"
      else;   info = "Displaying <strong>all #{collection.size}</strong> #{collection_name.pluralize}"
      end
    else
      offset_value = collection.per_page * (collection.current_page - 1)

      info = %{Displaying #{collection_name.pluralize} <strong>%d&ndash;%d</strong> of <strong>%d</strong> in total}% [
        offset_value + 1,
        offset_value + collection.length,
        collection.total_count
      ]
    end
    info.html_safe
  end

  def reader?
    current_role == 'reader'
  end
end
