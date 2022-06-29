# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.

# rules
#   - every second character of every third word should be capitalized
#   - already uppercase letters will remain upper case
#   - new string, original is not mutated

# test cases
# p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
#                 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
# p to_weird_case(
#   'It is a long established fact that a reader will be distracted') ==
#   'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
# p to_weird_case('aaA bB c') == 'aaA bB c'
# p to_weird_case(
#   'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
#   'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

# algorithm
#   - loop through all words in the string
#   - for every third word, loop through all characters
#   - for every second character, upcase the letter
#   - combine the letters and words back together and return the string

def to_weird_case(str)
  nth_word = 3
  nth_character = 2

  word_index = 0
  str.split.map do |word|
    char_index = 0

    if (word_index + 1) % nth_word == 0
      word = word.chars.map do |char|
        char = char.upcase if (char_index + 1) % nth_character == 0
        char_index += 1
        char
      end.join
    end

    word_index += 1
    word
  end.join(' ')
end




p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
                 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case(
  'It is a long established fact that a reader will be distracted') ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
  'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
  'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'