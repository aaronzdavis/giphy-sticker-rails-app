class HomeController < ApplicationController
  def index
    @gif = GiphySticker.cat_gif
  end
end
