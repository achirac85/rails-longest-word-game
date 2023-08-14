# frozen_string_literal: true

module GamesHelper
  def score_message(score)
    if score >= 3
      'Well Done!'
    else
      'Try again!'
    end
  end
end
