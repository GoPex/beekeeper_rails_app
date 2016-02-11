class WelcomeController < ApplicationController
  require 'beekeeper'
  def index
    @version = Beekeeper::Info.version
  end
end
