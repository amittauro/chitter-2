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

  context 'when checking that user exixts' do
    it 'returns true if email or username exists' do
      user = User.new(
        email: 'user@example.com',
        name: 'Amit Tauro',
        username: 'artauro'
      )
      user.password = 'password'
      user.save!
      expect(User.exists?(username: 'artauro', email: 'user@example.com')).to eq(true)
    end

    it 'returns false if neither email or password exists' do
      expect(User.exists?(username: 'artauro', email: 'user@example.com')).to eq(false)
    end
  end
end
