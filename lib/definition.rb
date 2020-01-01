class Definition
  attr_reader :id
  attr_accessor :word_def, :actual_word

  @@definitions = {}
  @@total_rows = 0

  def initialize(word_def, actual_word, id = nil)
  @word_def = word_def
  @actual_word = actual_word
  @id = id || @@total_rows += 1
  end

  def word
    Word.find(self.actual_word)
  end

  def self.find_by_word(actual_word)
    definitions = []
    @@definitions.values.each do |definition|
      if definition.actual_word == actual_word
        definitions.push(definition)
      end
    end
    definitions
  end

  def self.all
    @@definitions.values
  end

  def save
    @@definitions[self.id] = Definition.new(self.word_def, self.actual_word, self.id)
  end

  def self.find(id)
    @@definitions[id]
  end

  def update(word_def, actual_word)
    self.word_def = word_def
    self.actual_word = actual_word
    @@definitions[self.id] = Definition.new(self.word_def, self.actual_word, self.id)
  end

  def delete
    @@definitions.delete(self.id)
  end

  def self.clear
    @@definitions = {}
  end

end
