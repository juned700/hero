module EventsHelper
  def event_price(price)
    if price.blank? || price.zero?
      'Free'
    else
      number_to_currency(price, unit: 'RS ')
    end
  end

  def event_date(date)
    return date.strftime('%d/%B/%Y : %H:%M %p') if date 
    'Comming Soon'
  end
end
