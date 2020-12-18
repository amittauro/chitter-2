require './models/peep'
require './models/user'
require 'date'

describe Peep do
  context 'creating a peep' do
    it 'persists the peep within the database' do
      user = User.create_with_bcrypt(
        email: 'user@example.com',
        name: 'Amit Tauro',
        username: 'artauro',
        password: 'password'
      )
      peep = Peep.create(user_id: user.id, message: 'hello', time: DateTime.now)
      expect(peep.id).not_to eq(nil)
    end
  end

  context 'viewing the time a peep was made' do
    it 'returns the peep time as a string' do
      user = User.create_with_bcrypt(
        email: 'user@example.com',
        name: 'Amit Tauro',
        username: 'artauro',
        password: 'password'
      )
      peep = Peep.create(user_id: user.id, message: 'hello', time: DateTime.new(2001,2,3,4,5,6))
      expect(peep.format_time).to eq('February 3rd, 2001 04:05')
    end
  end
end
