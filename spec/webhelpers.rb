def sign_up(email, password)
  visit('/users/sign_up')
  fill_in "user_email", with: email
  fill_in "user_password", with: password
  fill_in "user_password_confirmation", with: password
  click_button("Sign up")
end 

def create_test_user_and_login(email, password)
  User.create(id: 1, email: email, password: password)
  visit('/users/sign_in')
  fill_in "user_email", with: email
  fill_in "user_password", with: password
  click_button("Log in")
end 
