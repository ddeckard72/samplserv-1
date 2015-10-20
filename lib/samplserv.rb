require "samplserv/version"
require "sinatra/base"
require "pry"

module Samplserv
  class App < Sinatra::Base
    set :logging, true

    get "/" do
      "Welcome to Samplserv!"
    end

    post "/beat" do
      spawn("afplay \"samples/beat.mp3\"")
      "The beat starts"
    end

    post "/better" do
      version = params["v"] ? params["v"].to_i : 1
      spawn("afplay \"samples/Better#{version}.mp3\"")
      "Better"
    end

    post "/harder" do
      version = params["v"] ? params["v"].to_i : 1
      spawn("afplay \"samples/Harder#{version}.mp3\"")
      "Harder"
    end

    post "/faster" do
      version = params["v"] ? params["v"].to_i : 1
      spawn("afplay \"samples/Faster#{version}.mp3\"")
      "Faster"
    end

    post "/stronger" do
      version = params["v"] ? params["v"].to_i : 1
      spawn("afplay \"samples/Stronger#{version}.mp3\"")
      "Stronger"
    end

    get "/stop" do
      spawn("killall afplay")
      "So much for the music..."
    end

    run! if app_file == $0
  end
end
