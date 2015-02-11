class HomeController < ApplicationController
  def index
    if params[:g]
      @gif = params[:g]
    else
      params[:q] ||= "cats"
      @gif = GiphySticker.rand_gif(params[:q])
    end
  end
end
