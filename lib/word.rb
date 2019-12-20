class Word
  attr_reader :id
  attr_accessor :actual_word

  def initialize(id = nil, actual_word)
    @id = id || @@total_rows +=1
    @actual_word = actual_word
  end

  def save
    @@words[self.id] = self
  end

  def update(actual_word)
  @actual_word = actual_word
end

def delete
  @@words.delete(@id)
end

  ##class Methods
  @@words = {}
  @@total_rows = 0

  def self.clear
    @@words = {}
    @@total_rows = 0
  end

  def self.all
    @@words.values
  end

end
