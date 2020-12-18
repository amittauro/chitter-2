def sign_in
  visit '/users/new'
  fill_in 'email', with: 'user@example.com'
  fill_in 'password', with: 'password'
  fill_in 'name', with: 'Amit Tauro'
  fill_in 'username', with: 'artauro'
  click_button 'submit'
end
