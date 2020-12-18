describe 'authentication', type: :feature do
  scenario 'a user can sign up with a unique email and password' do
    visit '/users/new'
    fill_in 'email', with: 'user@example.com'
    fill_in 'password', with: 'password'
    fill_in 'name', with: 'Amit Tauro'
    fill_in 'username', with: 'artauro'
    click_button 'submit'
    expect(current_path).to eq('/session/new')
    expect(page).to have_content('You have successfully signed up!')
  end

  scenario 'a user cant sign up if username or email already exists' do
    sign_up
    sign_up
    expect(current_path).to eq('/users/new')
    expect(page).to have_content('User already exists please try a different username and email')
  end

  scenario 'a user can log in with valid details' do
    sign_up
    fill_in 'email', with: 'user@example.com'
    fill_in 'password', with: 'password'
    click_button 'submit'
    expect(current_path).to eq('/peeps/new')
    expect(page).to have_content('You have succesfully logged in!')
  end

  scenario 'a user cant login with invalid password' do
    sign_up
    fill_in 'email', with: 'user@example.com'
    fill_in 'password', with: 'passward'
    click_button 'submit'
    expect(current_path).to eq('/session/new')
    expect(page).to have_content('Invalid password please try again')
  end

  scenario 'a user can log out' do
    sign_up_and_log_in
    visit '/peeps'
    click_button 'log out'
    expect(current_path).to eq('/')
    expect(page).to have_content('artauro you have succesfully signed out')
  end
end
