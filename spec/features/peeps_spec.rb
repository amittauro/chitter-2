describe 'peeps', type: :feature do
  scenario 'a user can post a peep' do
    sign_up_and_log_in
    fill_in 'peep', with: 'my first peep'
    click_button 'submit'
    expect(current_path).to eq('/peeps')
    expect(page).to have_content('Peeps')
  end

  scenario 'a user can post a peep and then view this peep' do
    sign_up_and_log_in
    fill_in 'peep', with: 'my first peep'
    click_button 'submit'
    expect(current_path).to eq('/peeps')
    expect(page).to have_content('my first peep')
  end

  scenario 'after peeps are posted they are viewed with their time they were made' do
    user = User.create_with_bcrypt(
      email: 'user@example.com',
      name: 'Amit Tauro',
      username: 'artauro',
      password: 'password'
    )
    Peep.create(user_id: user.id, message: 'hello', time: 'time')
    visit '/peeps'
    expect(page).to have_content('time')
  end
end
