class GiphySticker

  def self.search(search)
    if search.blank?
      raise "Search cannot be blank"
    else
      search = search.strip.downcase.gsub(/[^a-z0-9 ]+/, '')
      redis_key = "gs-#{search.chomp('-')}"

      # Attempt to get giphy data from redis store
      if response = REDIS.get(redis_key)
        response = JSON.parse(response)

      # Else grab data from giphy and store in redis
      else
        api_key     = 'dc6zaTOxFJmzC'
        sticker_url = 'http://api.giphy.com/v1/stickers/search'
        response       = HTTParty.get sticker_url,
                        query: {
                                api_key: api_key,
                                q: search,
                                limit: 100
                               }
        REDIS.setex(redis_key, 3600, response.to_json)
      end
      Hashie::Mash.new response
    end
  end

  def self.rand_gif(search)
    self.search(search).data.sample.images.original.url
  end

end