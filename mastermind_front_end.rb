require 'sinatra'
require './mastermind.rb'

game = nil
board= nil
get '/' do

  msg=""
  erb :index, :locals => {message: msg}

end

get '/game' do
  over = false

  #only do this when the page is first loaded
  unless params[:human].nil?
    game = params[:human] == "Code breaker" ?
      Game.new(12,HumanPlayer.new,ComputerPlayer.new) : Game.new(12,ComputerPlayer.new,HumanPlayer.new)
    board=game.board
  end

  msg=""

  if params[:guess].nil?
    #this is the first time the screen has been shown. 
  else
    #a choice has been made
    current_guess = []
    4.times{|index| current_guess << COLORS.index(COLOR_CODES.key(params["button#{index}".to_sym]))}

    game.respond_to_guess(current_guess.join)
    board.guessesUsed = board.guesses_used + 1
  end

  if board.won?
    msg = "Congratulations, #{game.codeBreaker}, you guessed the code in #{board.guesses_used} guesses!"
    over=true
  elsif board.out_of_guesses?
    msg = "Congratulations, #{game.codeMaker}, you stumped the #{game.codeBreaker}!"
    over=true
  else
    msg="#{game.codeBreaker}, you have #{board.guesses_left} guesses left."
  end

  #display the board
  erb :game, :locals => {board: board, message: msg, over:over}

end


