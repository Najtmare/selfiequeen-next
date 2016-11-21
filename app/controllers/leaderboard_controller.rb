class LeaderboardController < ApplicationController

  def index
    @leaders = User.average_rating
  end
end