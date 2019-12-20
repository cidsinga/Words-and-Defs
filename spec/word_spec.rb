require 'rspec'
require 'word'
require 'definition'

describe 'Word' do
  before(:each) do
    Word.clear()
    @word1 = Word.new('house').save
    @word2 = Word.new('car').save
    @word3 = Word.new('mountain').save
  end
  describe('.all') do
    it('returns an empty array when there are no words') do
      Word.clear
      expect(Word.all).to(eq([]))
    end
  end
end
