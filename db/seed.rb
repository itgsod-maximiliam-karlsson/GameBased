class Seeder

  def self.seed!
    self.games
    self.languages
    self.translations
    self.tags
    self.taggings
    self.roles
    self.users
    self.comment
  end

  def self.games
    Game.create(name: 'Counter Strike', description: 'A FPS video game.',
                base_language_id: 1, release_date: '19/6/1999', rating: 7, img: 'http://static.giantbomb.com/uploads/scale_small/1/13692/2302957-i2cs9uzmq4yua.jpg', category: 'action')
    Game.create(name: 'Team Fortress 2', description: 'A team based FPS video game.',
                base_language_id: 1, release_date: '9/10/2007', rating: 6, img: '', category: 'action')
  end

  def self.languages
    Language.create(name: 'English')
    Language.create(name: 'Swedish')
    Language.create(name: 'Finnish')
    Language.create(name: 'Russian')
    Language.create(name: 'Japanese')
  end

  def self.translations
    Translation.create(game_id: 1, language_id: 2)
    Translation.create(game_id: 1, language_id: 3)
    Translation.create(game_id: 1, language_id: 4)

    Translation.create(game_id: 2, language_id: 2)
    Translation.create(game_id: 2, language_id: 3)
    Translation.create(game_id: 2, language_id: 5)
  end

  def self.tags
    Tag.create(name: 'FPS')
    Tag.create(name: 'MMO')
    Tag.create(name: 'RPG')
    Tag.create(name: 'JRPG')
  end

  def self.comment
    Comment.create(comment: 'test1', points: 7, game_id: 1, user_id: 1)
    Comment.create(comment: 'test2', points: 3, game_id: 2, user_id: 2)
    Comment.create(comment: 'test3', points: 6, game_id: 1, user_id: 2)
    Comment.create(comment: 'test4', points: 8, game_id: 1, user_id: 3)
  end

  def self.taggings
    Tagging.create(game_id: 1, tag_id: 1)
    Tagging.create(game_id: 1, tag_id: 3)

    Tagging.create(game_id: 2, tag_id: 2)
    Tagging.create(game_id: 2, tag_id: 4)
  end

  def self.roles
    Role.create(permission: 'User', description: 'Regular user')
    Role.create(permission: 'Moderator', description: 'Handles the forum and comments')
    Role.create(permission: 'Admin', description: 'In charge, access to everything')
  end

  def self.users
    User.create(username: 'xXdragonslayerXx', email: 'thatguy@gmail.com', password: 'mmh', role: Role.first)
  end
end