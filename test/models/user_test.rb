require_relative 'models_helper'

describe User do

  DataMapper.auto_migrate!

  describe 'creating a user' do

    it 'should require a username' do
      expect( User.count ).to eq 0
      User.create(username: 'Test', email: 'test@test.com', password: 'password', membership: 'user', user_role_id: 1)
      expect( User.count ).to eq 1
      User.create(username: 'korv')
      expect( User.count ).to eq 1

    end

  end

  describe 'password bcrypt converter' do
    it 'should check if the password is in plantext' do
      user = User.create(username: 'Test', email: 'test@test.com', password: 'password', membership: 'user', user_role_id: 1)
      expect( user.name ).to match 'Grill Korv'
    end
  end

end