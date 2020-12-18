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
end
