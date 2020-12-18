require './models/user'

describe User do
  context 'creating a new user' do
    it 'persists the user with a bcrypt password' do
      user = User.new(
        email: 'user@example.com',
        name: 'Amit Tauro',
        username: 'artauro'
      )
      user.password = 'password'
      user.save!
      expect(user.id).not_to eq(nil)
    end
  end
end
