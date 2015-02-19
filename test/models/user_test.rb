require_relative 'models_helper'

describe User do

  #DataMapper.auto_migrate!

  describe 'creating a user' do

    before do
      DataMapper.auto_migrate!
    end

    it 'should require a unique username' do
      expect( User.count ).to eq 0
      user = User.create(username: 'Test', email: 'test@test.com', password: 'password', role_id: 1)
      expect( user ).to be_valid
      expect( User.count ).to eq 1

      user = User.create(username: 'Test', email: 'test@test.com', password: 'password', role_id: 1)
      expect( user ).not_to be_valid
      expect( user.errors[:username] ).to eq ["Username is already taken"]
      expect( User.count ).to eq 1

      user = User.create(email: 'test@test.com', password: 'password', role_id: 1)
      expect( user ).not_to be_valid
      expect( user.errors[:username] ).to eq ["Username must not be blank"]
      expect( User.count ).to eq 1
    end

    it 'should require a unique email' do
      user = User.create(username: 'Test2', email: 'test2@test.com', password: 'password', role_id: 1)
      expect( user ).to be_valid
      expect( User.count ).to eq 1

      user = User.create(username: 'Test2', email: 'test2@test.com', password: 'password', role_id: 1)
      expect( user ).not_to be_valid
      expect( user.errors[:email] ).to eq ["Email is already taken"]
      expect( User.count ).to eq 1

      user = User.create(username: 'test2', password: 'password', role_id: 1)
      expect( user ).not_to be_valid
      expect( user.errors[:email] ).to eq ["Email must not be blank"]
      expect( User.count ).to eq 1
    end
  #
    it 'should require a password' do
      expect( User.count ).to eq 0
      User.create(username: 'Test', email: 'test@test.com', password: 'password', role_id: 1)
      expect( User.count ).to eq 1
      user = User.create(username: 'Test', email: 'test@test.com', role_id: 1)
      expect( user ).not_to be_valid
      expect( user.errors[:password] ).to eq ["Password must not be blank"]
      expect( User.count ).to eq 1
    end

  end
  
  describe 'password bcrypt converter' do

    DataMapper.auto_migrate!

    it 'should check if the password is in bcrypt' do
      user = User.create(username: 'Test', email: 'test@test.com', password: 'secret', role_id: 1)
      expect( user.password ).to match 'secret'
    end
  end

end
