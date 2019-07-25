require 'pry'
# require 'song'


class Board
  attr_accessor :name, :user, :id
  @@boards = {}
  @@nextId = 0

  def initialize(name, id=nil)
    @name = name
    @id = id || @@nextId += 1
  end

  def self.all
    @@boards.values()
  end

  def self.find(id)
    @@boards[id]
  end

  def self.clear
    @@boards = {}
    @@nextId = 0
  end
  def save
    @@boards[self.id] = Board.new(self.name,self.id)
  end
  #for testing
  def ==(board_to_compare)
    self.name() == board_to_compare.name()
  end

  def messages
    Message.find_by_board(self.id)
  end

end
