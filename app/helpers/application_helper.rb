module ApplicationHelper
  def format_currency(amount)
    number_to_currency(amount, unit: "COP ", separator: ",", delimiter: ".")
  end

  def options_from_collection_for_select(collection, value_method, text_method, selected_value = nil)
    collection.map do |item|
      value = item.send(value_method)
      text = item.send(text_method)
      selected_attribute = "selected" if value == selected_value
      content_tag(:option, text, value: value, selected: selected_attribute)
    end.join("\n").html_safe
  end
end
