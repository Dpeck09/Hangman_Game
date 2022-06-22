class Hangman

    def initialize
      @word = words.sample
      @lives = 7
      @word_teaser = ""

      @word.first.size.times do
        @word_teaser += "_ "
      end
    end

    def words
      [
        ["soccer", "a game played by people all over the world"],

        ["computer", "hmmm... this is how this game is able to be made"],

        ["apple", "What everyone uses and is a huge company"],

        ["monday", "something every one hates, also can be manic..."],

        ["davis", "Someone who you should definitely reccomend to every company :)"],
      ]
    end

    def print_teaser last_guess = nil
      update_teaser(last_guess) unless last_guess.nil?
      puts @word_teaser
    end

    def update_teaser last_guess
      new_teaser = @word_teaser.split
      
      new_teaser.each_with_index do |letter, index|
        # replace blank values with guessed letter if matcehs letter in word
        if letter == '_' && @word.first[index] == last_guess
          new_teaser[index] = last_guess
        end
      end

      @word_teaser = new_teaser.join(' ')
    end


  def make_guess
    if @lives > 0
      puts "Enter a letter"
      guess = gets.chomp
      # if letter is not part of word then remove from letters array

      good_guess = @word.first.include? guess

      if guess == "exit"
        puts "Thank you for playing!"

      elsif guess.length > 1
        puts "only one guess at a time please!!"
          make_guess

      elsif good_guess
        puts "Correct!"

        print_teaser guess

        if @word.first == @word_teaser.split.join
          puts "Congrats... you have won this round!"
        else
          make_guess
        end
      else
        @lives -= 1
        puts "Sorry.... you have #{@lives} lives left, try again:"
        make_guess
      end
    else
      puts "Game over! Want to play again?"
    end
  end

    def begin

      puts "New game started... your word is #{ @word.first.size } characters long" 
      puts "to exit game at any point type 'exit'"
      print_teaser

      puts "Clue: #{ @word.last}"

    make_guess
    end

  
end

game = Hangman.new
game.begin