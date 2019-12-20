class Word
  attr_read :id, :actual_word
  attr_accessor :def1, :def2, :def3

  def initialize(id = nil, actual_word, def1 = nil, def2 = nil, def3 = nil)
    @actual_word = actual_word
    @def1 = def1
    @def2 = def2
    @def3 = def3
    @id = id || @@total_rows +=1
  end

  def save
    @@words[self.id] = self

  end

  ##class Methods
  @@words = {}
  @@total_rows = 0

  def self.all
    @@words.

  end
end
