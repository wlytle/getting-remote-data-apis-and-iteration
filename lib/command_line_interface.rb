def welcome
  puts "Welcome to the Star Wars API search thing-a-majig"
end

def get_character_from_user
  puts "please enter a character name"
  # use gets to capture the user's input. This method should return that input, downcased.
  gets.strip
end
