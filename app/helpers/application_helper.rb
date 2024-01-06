module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'Lens Log'
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def show_rounded(number)
    if number.to_i == number
      number.to_i.to_s
    else
      number.round(2).to_s
    end

  end

  def show_prescription(number_str)
    number = number_str.to_f
    formatted_number = show_rounded(number)

    if number.positive?
      "+#{formatted_number}"
    else
      formatted_number
    end
  end
end

