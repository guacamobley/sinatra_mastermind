require 'sinatra'
require './mastermind.rb'

game = nil
get '/' do

  msg=""
  erb :index, :locals => {message: msg}

end

get '/game' do

  unless params[:human].nil?
    game = params[:human] == "Code breaker" ?
      Game.new(12,HumanPlayer.new,ComputerPlayer.new) : Game.new(12,ComputerPlayer.new,HumanPlayer.new)
  end

  board = game.board
  msg=""

  if params[:guess].nil?
    #this is the first time the screen has been shown. 
  end

=begin
  #process previous guess, if there is one.
  #
  #check to see if the game has been won.
  #
  #display the board
  #
  #ask for a new guess (inside the form)

  if board.won? || board.out_of_guesses?

  else

  msg = ""

  erb :game, :locals => {board: board,msg: message}


    board.display

    puts "#{codeBreaker}, you have #{board.guesses_left} guesses left."

    #this is where the input needs to be
    current_guess = codeBreaker.guess(board)

    respond_to_guess(current_guess)

    board.guessesUsed = board.guesses_used + 1
  end

  board.display
  if board.won?
    puts "Congratulations, #{codeBreaker}, you guessed the code in #{board.guesses_used} guesses!"
    puts "The secret code was #{board.answerRow}"
  else
    puts "Congratulations, #{codeMaker}, you stumped the #{codeBreaker}!"
  end
=end
  erb :game, :locals => {board: board,message: msg}

end


