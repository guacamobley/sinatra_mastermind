require 'sinatra'
require './mastermind.rb'

game = nil
board= nil

get '/' do
  over = false

  #only do this when the page is first loaded
  if params[:guess].nil?
    game = Game.new(12,HumanPlayer.new,ComputerPlayer.new)
    board=game.board

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
  erb :index, :locals => {board: board, message: msg, over:over}

end
