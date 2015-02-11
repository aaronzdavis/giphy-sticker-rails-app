class HomeController < ApplicationController
  def index
    @gif = GiphySticker.rand_cat_gif
  end
end
