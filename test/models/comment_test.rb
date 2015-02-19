require_relative 'models_helper'

describe Comment do

  describe 'create a comment' do

    before do
      DataMapper.auto_migrate!
    end

    it 'should require comment' do
      expect( Comment.count ).to eq 0
      comment = Comment.create(comment: 'this is a game', points: 1, game_id: 1, user_id: 1)
      expect( comment ).to be_valid
      expect( Comment.count ).to eq 1

      comment = Comment.create(points: 1, game_id: 1, user_id: 1)
      expect( comment ).not_to be_valid
      expect( comment.errors[:comment] ).to eq ["Comment must not be blank"]
      expect( Comment.count ).to eq 1
    end
  end
end