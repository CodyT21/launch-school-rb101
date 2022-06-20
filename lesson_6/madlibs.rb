=begin
Madlibs Revisited
Madlibs program will read in text from another file, then
will plug in a selection of randomized nouns, verbs, adjectives,
and adverbs into that text that it prints out.

The list of nouns, verbs, adjectives, and adverbs will be built
into the program and not from a separate file.

Input text will specify the location of the words to be inserted by either text reading
either '%{noun}', '%{verb}', '%{adjective}', or '%{adverb}'. The file text
will not be changed when this program is ran.

=end

NOUNS = %w(fox dog head leg)
VERBS = %w(jumps lifts bits licks)
ADJECTIVEs = %w(quick lazy sleepy ugly)
ADVERBS = %w(easily lazily noisily excitedly)
