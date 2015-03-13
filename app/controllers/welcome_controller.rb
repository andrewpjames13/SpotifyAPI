class WelcomeController < ApplicationController

  def index
    @fetcher = SpotifyFetcher.new
  end

end
