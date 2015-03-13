class SpotifyFetcher

  def initialize
    @spotify_data = Faraday.new(:url => 'https://api.spotify.com') do |faraday|
    faraday.request  :url_encoded             # form-encode POST params
    faraday.response :logger                  # log requests to STDOUT
    faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  def spotify_entity
    response = @spotify_data.get do |req|
      req.url "/v1/artists", {ids: "7a2ixVyixq5t2Ju21uHRcV"}
      req.headers['Content-Type'] = 'application/json'
    end

    JSON.parse(response.body)
  end

  def spotify_albums
    response = @spotify_data.get do |req|
      req.url "/v1/albums", {ids: "5wQvc26H9ogMioWKB43UH1"}
      req.headers['Content-Type'] = 'application/json'
    end

    JSON.parse(response.body)
  end
end

def spotify_tracks
  response = @spotify_data.get do |req|
    req.url "/v1/tracks", {ids: "0szgBzpEwBVlc5eeSm6QSE,4pFkUNufrQMIDnlXD1MHPG,1Fe8XwfB3Qx8O3AkGlFKs1,3jzKxaNr2k6AFx6SbnxqxY"}
    req.headers['Content-Type'] = 'application/json'
  end

  JSON.parse(response.body)
end
end

# Client ID
# fb4b97fea61d44dc90e70ee8b5304845
# Client Secret
# 3ba27bce5abe436695a56f89d90e88e3
