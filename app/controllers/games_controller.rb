# frozen_string_literal: true

class GamesController < ApplicationController
  def new
    @letters = generate_random_letters(10)
  end

  def score
    @word = params[:word]
    @letters = params[:grid]
    @time_taken = Time.now - Time.parse(params[:start_time])
    @score = calculate_score(@word, @time_taken)
  end

  private

  def word_can_be_built?(word, letters)
    word.chars.all? { |letter| letters.include?(letter) }
  end

  def valid_english_word?(word)
    response = HTTP.get("https://api.dictionaryapi.dev/api/v2/entries/en/#{word}?key=YOUR_API_KEY")
    response.code == 200
  end

  def generate_random_letters(size)
    ('A'..'Z').to_a.sample(size)
  end

  def calculate_score(word, time_taken)
    # Replace this with your logic to calculate the score
    # For example, you can base the score on word length and time taken
    word_length_score = word.length
    time_score = 10 / time_taken # Adjust this calculation as needed
    total_score = word_length_score * time_score
    total_score.round(2) # Round the score to two decimal places
  end
end
