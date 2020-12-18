require './models/user'

describe User do
  context 'creating a new user' do
    it 'persists the user' do
      user = User.create(
        email: 'user@example.com',
        password: 'password',
        name: 'Amit Tauro',
        username: 'artauro'
      )
      expect(user.id).not_to eq(nil)
    end
  end
end
