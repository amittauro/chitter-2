def sign_up
  visit '/users/new'
  fill_in 'email', with: 'user@example.com'
  fill_in 'password', with: 'password'
  fill_in 'name', with: 'Amit Tauro'
  fill_in 'username', with: 'artauro'
  click_button 'submit'
end

def sign_up_and_log_in
  visit '/users/new'
  fill_in 'email', with: 'user@example.com'
  fill_in 'password', with: 'password'
  fill_in 'name', with: 'Amit Tauro'
  fill_in 'username', with: 'artauro'
  click_button 'submit'
  fill_in 'email', with: 'user@example.com'
  fill_in 'password', with: 'password'
  click_button 'submit'
end

def post_peep(message)
  visit '/peeps/new'
  fill_in 'peep', with: message
  click_button 'submit'
end
