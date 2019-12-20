require 'rspec'
require 'word'
require 'definition'
require 'pry'

describe 'Word' do
  before(:each) do
    Word.clear()
    @word1 = Word.new("house").save
    @word2 = Word.new("car").save
    @word3 = Word.new("mountain").save

  end
  describe ('.all') do
    it ('returns an empty array when there are no words')do
      Word.clear
      expect(Word.all).to(eq([]))
    end
  end

  describe ('#save') do
    it('saves a word') do
      word4 = Word.new(nil, "rock").save
      expect(Word.all).to(eq([@word1, @word2, @word3, word4]))
    end
  end

  describe ('#update') do
    it('updates the name of the word') do
      @word3.update("lake")
      expect(@word3.actual_word).to(eq("lake"))
    end
  end

  describe ('#delete') do
    it('deletes a word from the hash') do
      @word3.delete
      expect(Word.all).to(eq([@word1, @word2]))
    end
  end


end
