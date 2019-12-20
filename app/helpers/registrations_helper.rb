module RegistrationsHelper
  def regiter_or_soldout(event)
    if event.sold_out?
      content_tag :span , "Sold Out", class: 'sold_out'
    else
      link_to "Register", new_event_registration_path(@event), class: 'btn btn-primary'
    end
  end
end
