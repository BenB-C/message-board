require 'pry'

class Message
  attr_accessor :message, :user, :board_id, :id
  @@messages = {}
  @@next_id = 0

  def initialize(message, user, board_id, id = nil)
    @message = message
    @user = user
    @board_id = board_id
    @id = id || @@next_id += 1
  end

  def self.all
    @@messages.values()
  end

  def self.clear
    @@messages = {}
    @@next_id = 0
  end

  def self.find(id)
    @@messages[id]
  end

  def self.find_by_board(board_id)
    @@messages.values.select { |message| message.board_id == board_id }
  end

  def save
    @@messages[self.id] =  Message.new(self.message, self.user, self.board_id, self.id)
  end

  def ==(other_message)
    @message == other_message.message && @board_id == other_message.board_id && @user == other_message.user && @id == other_message.id
  end



end
