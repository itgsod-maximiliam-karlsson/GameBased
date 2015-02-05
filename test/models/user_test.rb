require_relative 'models_helper'

describe User do

  DataMapper.auto_migrate!

  describe 'creating a user' do

    it 'should require a first name' do
      expect( User.count ).to eq 0
      User.create(first_name: 'Test', lastname: 'lasttest')
      expect( User.count ).to eq 1
      User.create(last_name: 'korv')
      expect( User.count ).to eq 1

    end

  end

  describe 'name convenience method' do
    it 'should combine first and last names' do
      user = User.create(first_name: 'Grill', last_name: 'Korv')
      expect( user.name ).to match 'Grill Korv'
    end
  end

end