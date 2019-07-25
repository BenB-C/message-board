require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/board.rb')
require('./lib/message.rb')

get ('/') do
  @boards = Board.all
  erb(:boards)
end
get ('/boards') do
  @boards = Board.all
  erb(:boards)
  end
get ('/board/new') do
  erb(:new_board)
end
post ('/boards') do
  name = params[:board_name]
  topic = params[:board_topic]
  board = Board.new(name)
  board.save()
  redirect to('/boards')
end
get ('/boards/:id') do
  @board_id = params[:id].to_i
  @board = Board.find(@board_id)
  @messages = Message.find_by_board(@board_id)
  erb(:board)
end

get ('/boards/:id/message/new') do
  @board_id = params[:id].to_i
  erb(:new_message)
end

post ('/boards/:id/messages') do
  user = params[:user]
  @board = Board.find(params[:id].to_i)
  message_text = params[:message]
  board_id = params[:id].to_i
  new_message = Message.new(message_text, user, board_id)
  new_message.save()
  redirect to("/boards/#{board_id}")
end
