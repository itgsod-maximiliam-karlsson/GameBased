require_relative 'models_helper'

describe User do

  DataMapper.auto_migrate!

  describe 'creating a user' do

    it 'should require a username' do
      expect( User.count ).to eq 0
      User.create(username: 'Test', email: 'test@test.com', password: 'password', membership: 'user', user_role_id: 1)
      expect( User.count ).to eq 1
      User.create(email: 'test@test.com', password: 'password', membership: 'user', user_role_id: 1)
      expect( User.count ).to eq 1
    end

    it 'should require a email' do
      expect( User.count ).to eq 0
      User.create(username: 'Test', email: 'test@test.com', password: 'password', membership: 'user', user_role_id: 1)
      expect( User.count ).to eq 1
      User.create(username: 'Test', password: 'password', membership: 'user', user_role_id: 1)
      expect( User.count ).to eq 1
    end

    it 'should require a password' do
      expect( User.count ).to eq 0
      User.create(username: 'Test', email: 'test@test.com', password: 'password', membership: 'user', user_role_id: 1)
      expect( User.count ).to eq 1
      User.create(username: 'Test', email: 'test@test.com', membership: 'user', user_role_id: 1)
      expect( User.count ).to eq 1
    end

    it 'should require a membership' do
      expect( User.count ).to eq 0
      User.create(username: 'Test', email: 'test@test.com', password: 'password', membership: 'user', user_role_id: 1)
      expect( User.count ).to eq 1
      User.create(username: 'Test', email: 'test@test.com', password: 'password', user_role_id: 1)
      expect( User.count ).to eq 1
    end

    it 'should require a user_role_id' do
      expect( User.count ).to eq 0
      User.create(username: 'Test', email: 'test@test.com', password: 'password', membership: 'user', user_role_id: 1)
      expect( User.count ).to eq 1
      User.create(username: 'Test', email: 'test@test.com', password: 'password', membership: 'user')
      expect( User.count ).to eq 1
    end


  end

  describe 'password bcrypt converter' do
    it 'should check if the password is in plantext' do
      user = User.create(username: 'Test', email: 'test@test.com', password: 'secret', membership: 'user', user_role_id: 1)
      expect( user.password ).to match 'secret'
    end
  end

end