require_relative 'models_helper'

describe User do

  DataMapper.auto_migrate!

  describe 'create a game' do

    it 'should require name' do
      expect( Game.count ).to eq 0
      Game.create(name: 'cunter stocked', description: 'this is a game', base_language_id: 1, release_date: '2015-11-11', rating: 1)
      expect( Game.count ).to eq 1
      Game.create(description: 'this is a game', base_language_id: 1, release_date: '2015-11-11', rating: 1)
      expect( Game.count ).to eq 1
    end

    it 'should require description' do
      expect( Game.count ).to eq 0
      Game.create(name: 'cunter stocked', description: 'this is a game', base_language_id: 1, release_date: '2015-11-11', rating: 1)
      expect( Game.count ).to eq 1
      Game.create(name: 'cunter stocked', base_language_id: 1, release_date: '2015-11-11', rating: 1)
      expect( Game.count ).to eq 1
    end

    it 'should require base_language_id' do
      expect( Game.count ).to eq 0
      Game.create(name: 'cunter stocked', description: 'this is a game', base_language_id: 1, release_date: '2015-11-11', rating: 1)
      expect( Game.count ).to eq 1
      Game.create(name: 'cunter socked',description: 'this is a game', release_date: '2015-11-11', rating: 1)
      expect( Game.count ).to eq 1
    end

    it 'should require release_date' do
      expect( Game.count ).to eq 0
      Game.create(name: 'cunter stocked', description: 'this is a game', base_language_id: 1, release_date: '2015-11-11', rating: 1)
      expect( Game.count ).to eq 1
      Game.create(name: 'cunter stocked', description: 'this is a game', base_language_id: 1, rating: 1)
      expect( Game.count ).to eq 1
    end

    it 'should require rating' do
      expect( Game.count ).to eq 0
      Game.create(name: 'cunter stocked', description: 'this is a game', base_language_id: 1, release_date: '2015-11-11', rating: 1)
      expect( Game.count ).to eq 1
      Game.create(name: 'cunter stocked', description: 'this is a game', base_language_id: 1, release_date: '2015-11-11')
      expect( Game.count ).to eq 1
    end

  end
end