require_relative 'models_helper'

describe Game do

  describe 'create a game' do

    before do
      DataMapper.auto_migrate!
    end

    it 'should require name' do
      expect( Game.count ).to eq 0
      game = Game.create(name: 'cunter stocked', description: 'this is a game', base_language_id: 1, release_date: '2015-11-11', rating: 1, img: '')
      expect( game ).to be_valid
      expect( Game.count ).to eq 1

      game = Game.create(name: 'cunter stocked', description: 'this is a game', base_language_id: 1, release_date: '2015-11-11', rating: 1, img: '')
      expect( game ).not_to be_valid
      expect( game.errors[:name] ).to eq ["Name is already taken"]
      expect( Game.count ).to eq 1

      game = Game.create(description: 'this is a game', base_language_id: 1, release_date: '2015-11-11', rating: 1, img: '')
      expect( game ).not_to be_valid
      expect( game.errors[:name] ).to eq ["Name must not be blank"]
      expect( Game.count ).to eq 1
    end

    it 'should require description' do
      expect( Game.count ).to eq 0
      game = Game.create(name: 'cunter stocked', description: 'this is a game', base_language_id: 1, release_date: '2015-11-11', rating: 1, img: '')
      expect( game ).to be_valid
      expect( Game.count ).to eq 1

      game = Game.create(name: 'cunter stocked', base_language_id: 1, release_date: '2015-11-11', rating: 1, img: '')
      expect( game ).not_to be_valid
      expect( Game.count ).to eq 1
    end

    it 'should require base_language_id' do
      expect( Game.count ).to eq 0
      game = Game.create(name: 'cunter stocked', description: 'this is a game', base_language_id: 1, release_date: '2015-11-11', rating: 1, img: '')
      expect( game ).to be_valid
      expect( Game.count ).to eq 1

      game = Game.create(name: 'cunter stocked', description: 'this is a game', release_date: '2015-11-11', rating: 1, img: '')
      expect( game ).not_to be_valid
      expect( Game.count ).to eq 1
    end
  end
end