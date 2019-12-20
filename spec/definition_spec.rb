require 'rspec'
require 'word'
require 'definition'
require 'pry'

describe '#Definition' do
  before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new("house", nil)
    @word.save()
  end

  describe('.all') do
    it('returns a list of all definitions') do
      definition1 = Definition.new("dwelling place", @actual_word, nil).save
      definition2 = Definition.new("shelter", @actual_word, nil).save
      expect(Definition.all).to(eq([definition1, definition2]))
    end
  end

  describe('.clear') do
  it("clears all definitions") do
    definition1 = Definition.new("dwelling place", @actual_word, nil).save
    definition2 = Definition.new("shelter", @actual_word, nil).save
    Definition.clear()
    expect(Definition.all).to(eq([]))
  end
end

describe('#save') do
  it("saves a definition") do
    definition1 = Definition.new("dwelling place", @actual_word, nil).save
    expect(Definition.all).to(eq([definition1]))
  end
end

describe('.find') do
  it("finds a song by id") do
    definition1 = Definition.new("dwelling place", @actual_word, nil).save
    definition2 = Definition.new("shelter", @actual_word, nil).save
    expect(Definition.find(definition1.id)).to(eq(definition1))
  end
end
describe('#update') do
  it("updates a definition by id") do
    definition1 = Definition.new("dwelling place", @word, nil).save
    definition1.update("ones Krib", @word)
    expect(definition1.word_def).to(eq("ones Krib"))
  end
end

describe('#delete') do
  it("deletes an definition by id") do
    definition1 = Definition.new("dwelling place", @actual_word, nil).save
    definition2 = Definition.new("shelter", @actual_word, nil).save
    definition1.delete()
    expect(Definition.all).to(eq([definition2]))
  end
end









end
