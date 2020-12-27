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

  context 'viewing peeps in reverse chronological order' do
    it 'returns the peeps in reverse order' do
      user = User.create_with_bcrypt(
        email: 'user@example.com',
        name: 'Amit Tauro',
        username: 'artauro',
        password: 'password'
      )
      peep1 = Peep.create(user_id: user.id, message: 'hello', time: DateTime.new(2005,2,3,4,5,6))
      peep2 = Peep.create(user_id: user.id, message: 'hello', time: DateTime.new(2003,2,3,4,5,6))
      peep3 = Peep.create(user_id: user.id, message: 'hello', time: DateTime.new(2009,2,3,4,5,6))
      peep4 = Peep.create(user_id: user.id, message: 'hello', time: DateTime.new(2008,2,3,4,5,6))
      expect(Peep.reverse_order).to eq([peep3, peep4, peep1, peep2])
    end
  end  
end
