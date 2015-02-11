class HomeController < ApplicationController
  def index
    params[:q] ||= "cats"
    @gif = GiphySticker.rand_gif(params[:q])
  end
end
