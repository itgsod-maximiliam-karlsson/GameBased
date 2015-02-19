require_relative 'models_helper'

describe Tag do

  DataMapper.auto_migrate!

  describe 'Should create a tag' do

    it 'should require a name' do
      expect( Tag.count ).to eq 0
      Tag.create(name: 'action')
      expect( Tag.count ).to eq 1
    end

  end
end