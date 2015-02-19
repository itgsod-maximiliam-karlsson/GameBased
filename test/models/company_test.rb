require_relative 'models_helper'

describe Company do

  describe 'crate a company' do

    before do
      DataMapper.auto_migrate!
    end

    it 'should require name' do
      expect( Company.count ).to eq 0
      company = Company.create(name: 'valve', rating: 3, description: 'this is valve')
      expect( company ).to be_valid
      expect( Company.count ).to eq 1

      company = Company.create(name: 'valve', rating: 3, description: 'this is valve')
      expect( company ).not_to be_valid
      expect( company.errors[:name] ).to eq ["Name is already taken"]
      expect( Company.count ).to eq 1

      company = Company.create(rating: 3, description: 'this is valve')
      expect( company ).not_to be_valid
      expect( company.errors[:name] ).to eq ["Name must not be blank"]
      expect( Company.count ).to eq 1
    end

    it 'should require description' do
      expect( Company.count ).to eq 0
      company = Company.create(name: 'valve', rating: 3, description: 'this is valve')
      expect( company ).to be_valid
      expect( Company.count ).to eq 1

      company = Company.create(name: 'this is valve', rating: 3)
      expect( company ).not_to be_valid
      expect( company.errors[:description] ).to eq ["Description must not be blank"]
      expect( Company.count ).to eq 1
    end

  end
end