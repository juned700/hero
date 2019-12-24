module UsersHelper

  def button_caption(user)
    user.new_record? ? 'Create Account' : 'Update Account'
  end
end
