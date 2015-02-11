require 'rails_helper'

RSpec.describe GiphySticker, :type => :model do

  let(:cats){GiphySticker.search('cats')}

  describe '.search' do
    it 'should not raise_error' do
      expect{cats}.not_to raise_error
    end

    it 'should raise_error for empty search term' do
      expect{GiphySticker.search('')}.to raise_error("Search cannot be blank")
    end

    it 'should be a Hashie::Mash' do
      expect(cats.class).to eq(Hashie::Mash)
    end

    it 'should respond to data' do
      expect(cats).to respond_to(:data)
    end
  end

end
