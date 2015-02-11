class GiphySticker

  def self.search(search, limit)
    offset      = rand(0..100)
    api_key     = 'dc6zaTOxFJmzC'
    sticker_url = 'http://api.giphy.com/v1/stickers/search'
    response    = HTTParty.get sticker_url,
                    query: {
                            q: search,
                            api_key: api_key,
                            offset: offset,
                            limit: limit
                           }
    Hashie::Mash.new response
  end

  def self.cat_gif
    self.search("cats", 1).data.sample.images.original.url
  end

end