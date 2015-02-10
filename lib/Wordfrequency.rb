class WordFrequency

REJECT_WORDS = ['I','a', 'to', 'the', 'on', 'for', 'am','at', 'of', 'do', 'you', 'be', 'in', 'and', 'he', 'with', 'that', 'what', 'are', 'as', 'an', 'all', 'we']

  def make_array(text)
    text.split(" ").reject {|w| REJECT_WORDS.include?(w) }
  end

end