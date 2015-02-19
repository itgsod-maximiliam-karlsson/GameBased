require_relative 'models_helper'

describe Comment do

  describe 'create a comment' do

    before do
      DataMapper.auto_migrate!
    end

    it 'should require type' do
      expect( Comment.count ).to eq 0
      Comment.create(type: 'user', comment: 'this is a game', points: 1, game_id: 1, user_id: 1)
      expect( Comment.count ).to eq 1
      Comment.create(comment: 'this is a game', points: 1, game_id: 1, user_id: 1)
      expect( Comment.count ).to eq 1
    end

    it 'should require comment' do
      expect( Comment.count ).to eq 0
      Comment.create(type: 'user', comment: 'this is a game', points: 1, game_id: 1, user_id: 1)
      expect( Comment.count ).to eq 1
      Comment.create(type:'user', points: 1, game_id: 1, user_id: 1)
      expect( Comment.count ).to eq 1
    end

    it 'should require points' do
      expect( Comment.count ).to eq 0
      Comment.create(type: 'user', comment: 'this is a game', points: 1, game_id: 1, user_id: 1)
      expect( Comment.count ).to eq 1
      Comment.create(type:'user', comment: 'this is a game', game_id: 1, user_id: 1)
      expect( Comment.count ).to eq 1
    end

  end
end