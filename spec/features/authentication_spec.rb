describe 'the sign up process', type: :feature do
  scenario 'a user can sign up with a unique email and password' do
    visit '/users/new'
    fill_in 'email', with: 'user@example.com'
    fill_in 'password', with: 'password'
    fill_in 'name', with: 'Amit Tauro'
    fill_in 'username', with: 'artauro'
    click_button 'submit'
    expect(current_path).to eq('/sessions/new')
    expect(page).to have_content('You have successfully signed up!')
  end
end
