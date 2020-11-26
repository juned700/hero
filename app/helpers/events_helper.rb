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

  def like_unlike_button(event)
    like = event.likes.find_by(user_id: current_user.id)
    if like
      link_to 'Unlike', event_like_path(event, like), method: :delete, class: 'btn btn-sm pull-right'
    else 
      link_to 'Like', event_likes_path(event), method: :post, class: 'btn btn-sm pull-right'
    end
  end
end
