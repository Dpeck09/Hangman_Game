class Hangman

  def initialize
    @letters = ('a'..'z').to_a
    @word = words.sample
  end

  def words
    [
      ["soccer", "a game played by people all over the world"],

      ["Computer", "hmmm... this is how this game is able to be made"],

      ["Apple", "What everyone uses and is a huge company"],

      ["Monday", "something every one hates, also can be manic..."],

      ["Davis", "Someone who you should definitely reccomend to every company :)"],
    ]
  end

  def begin

    puts "New game started... your word is #{@word.first.size} characters long" 

      word_teaser = ""

    @word.first.size.times do
      word_teaser += "_ "
    end

    puts word_teaser
    puts "Clue: #{ @word.last}"

    puts "Enter a letter"
    guess = gets.chomp

    
  end


end

game = Hangman.new
game.begin