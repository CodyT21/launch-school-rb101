=begin
Madlibs Revisited
Madlibs program will read in text from another file, then
will plug in a selection of randomized nouns, verbs, adjectives,
and adverbs into that text that it prints out.

The list of nouns, verbs, adjectives, and adverbs will be built
into the program and not from a separate file.

Input text will specify the location of the words to be inserted by either
'%{noun}', '%{verb}', '%{adjective}', or '%{adverb}'. The file text
will not be changed when this program is ran.

=end

NOUNS = %w(fox dog head leg)
VERBS = %w(jumps lifts bits licks)
ADJECTIVES = %w(quick lazy sleepy ugly)
ADVERBS = %w(easily lazily noisily excitedly)

file = File.open('madlibs_text.txt')
file_text = file.readlines.map(&:chomp)
madlibs_text = file_text.map do |line|
  line.split.map do |word|
    if word.include?('%{noun}')
      word.gsub('%{noun}', NOUNS.sample)
    elsif word.include?('%{verb}')
      word.gsub('%{verb}', VERBS.sample)
    elsif word.include?('%{adjective}')
      word.gsub('%{adjective}', ADJECTIVES.sample)
    elsif word.include?('%{adverb}')
      word.gsub('%{adverb}', ADVERBS.sample)
    else
      word
    end
  end.join(' ')
end
puts madlibs_text.join("\n")
