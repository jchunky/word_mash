def common_suffix(words)
  i = 1
  loop do
    break unless words.map { |word| word.chars.last(i).join }.uniq.one?

    i += 1
  end

  words.map { |word| word.chars.last(i - 1).join }.first
end

def remove_suffix(words, suffix)
  words.map do |word|
    word[0...-suffix.length]
  end
end

def remove_prefix(word, prefix)
  word[prefix.length..]
end

def find_suffix(words, word)
  prefix = words.find { |w| word.start_with?(w) }
  remove_prefix(word, prefix)
end

def apply_suffix(words, suffix)
  words.map { |word| word + suffix }
end

def create_mashup(words, seed_word)
  suffix = common_suffix(words)
  words = remove_suffix(words, suffix)
  new_suffix = find_suffix(words, seed_word)
  apply_suffix(words, new_suffix)
end

word_pattern = %w[anabolism catabolism metabolism]
seed_word = "analysis"

p create_mashup(word_pattern, seed_word)
