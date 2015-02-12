require_relative 'models_helper'

describe User do

  DataMapper.auto_migrate!

  describe 'crate a company' do

    it 'should require name' do
      expect( Company.count ).to eq 0
      Company.create(name: 'valve', rating: 3, description: 'this is valve')
      expect( Company.count ).to eq 1
      Company.create(rating: 3, description: 'valve')
      expect( Company.count ).to eq 1
    end

    it 'should require description' do
      expect( Company.count ).to eq 0
      Company.create(name: 'valve', rating: 3, description: 'this is valve')
      expect( Company.count ).to eq 1
      Company.create(name: 'this is valve', rating: 3)
      expect( Company.count ).to eq 1
    end

  end
end