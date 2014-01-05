module LoginHelpers
  def login_as(role)
    user = create(role)

    login_with(user)
  end

  def login_with(user)
    visit new_user_session_path

    fill_in 'user_email',    with: user.email
    fill_in 'user_password', with: user.password

    click_button 'Sign in'
  end
end
