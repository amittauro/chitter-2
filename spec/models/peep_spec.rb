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
end
