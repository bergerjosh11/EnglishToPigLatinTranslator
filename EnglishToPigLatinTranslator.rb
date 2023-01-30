class EnglishToPigLatinTranslator

  def translate(english_text)
    piglatin_text = []
    words = english_text.to_s.split(' ')
    words.each.map do |word|
      piglatin_text << translate_helper(word)
    end
    piglatin_text.join(' ')
  end

  def translate_helper(word)
    this_word, punctuations = punctuation(word)
    vowels = %w[a e i o u y A E I O U Y]
    characters = this_word.chars
    first_vowel = characters.find { |char| vowels.include?(char) }
    first_vowel_index = this_word.index(first_vowel)
    first_letter = this_word[0]
    translation = if vowels.include?(first_letter)
                    "#{this_word}way" + punctuations.to_s
                  else
                    this_word[first_vowel_index..-1] + this_word[0...first_vowel_index] + 'ay' + punctuations.to_s
                  end
    translation.upcase! if word == word.upcase
    translation.capitalize! if word[0] == word[0].upcase
    translation
  end

  def punctuation(word)
    word.scan(/[\w'-]+|[[:punct:]]+/)
  end
end

english_text = ["hello", "eat", "yellow", "eat world", "Hello", "Apples", "eat... world?", "school", "quick", "she's great!", "HELLO", "Hello There"]

initialize = EnglishToPigLatinTranslator.new
english_text.each do |word|
  translation = initialize.translate(word)
  puts translation
end
