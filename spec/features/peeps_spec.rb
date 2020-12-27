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
    Peep.create(user_id: user.id, message: 'hello', time: DateTime.new(2001,2,3,4,5,6))
    visit '/peeps'
    expect(page).to have_content('February 3rd, 2001 04:05')
  end

  scenario 'a user can tag a peep and the peep author receives an email' do
    user = User.create_with_bcrypt(
      email: 'user@example.com',
      name: 'Amit Tauro',
      username: 'artauro',
      password: 'password'
    )
    peep1 = Peep.create(user_id: user.id, message: 'hello1', time: DateTime.new(2001,2,3,4,5,6))
    peep2 = Peep.create(user_id: user.id, message: 'hello2', time: DateTime.new(2003,2,3,4,5,6))
    peep3 = Peep.create(user_id: user.id, message: 'hello3', time: DateTime.new(2009,2,3,4,5,6))
    sign_up_and_log_in_2
    click_link 'View peeps'
    within("form##{peep3.id}") do
      click_button 'tag'
    end
    expect(current_path).to eq('/peeps')
    expect(page).to have_content("You tagged message: hello3")
  end
end
