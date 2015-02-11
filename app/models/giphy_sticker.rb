class GiphySticker

  def self.search(search)
    offset      = rand(0..100)
    api_key     = 'dc6zaTOxFJmzC'
    sticker_url = 'http://api.giphy.com/v1/stickers/search'
    response    = HTTParty.get sticker_url,
                    query: {
                            q: search,
                            offset: offset,
                            api_key: api_key
                           }
    Hashie::Mash.new response
  end

  def self.cat_gif
    self.search("cats").data.sample.images.original.url
  end

end