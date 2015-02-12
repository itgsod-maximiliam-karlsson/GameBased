require_relative 'models_helper'

describe User do

  DataMapper.auto_migrate!

  describe 'Should create a tag' do

    it 'should require a name' do
      expect( Game.count ).to eq 0
      Game.create(name: 'action')
      expect( Game.count ).to eq 1
      Game.create()
      expect( Game.count ).to eq 1
    end

  end
end