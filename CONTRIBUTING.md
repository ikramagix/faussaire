# Become a Faussaire: Contributing Guidelines

Bonjour mighty programmer! 👋 Thinking about contributing to Faussaire? That’s awesome! Whether you’re a seasoned dev or just a begginer looking to practice, we’re excited to see what you’ll come up with. To keep things running smoothly, we’ve got a few guidelines for you. But first, a little note:

These are just guidelines—nothing here is set in stone. If you’ve got something cool to add, don’t be shy! Well-documented pull requests are always welcome, even if you don’t check every box below. We’re here to learn and have fun, after all! 😄

## Guidelines

1. **Tests, Tests, Tests:**
   - Every new feature, bug fix, or data addition needs to come with tests. 
   - Make sure your tests cover all the important stuff and that they pass before you submit your pull request. We love seeing those green checkmarks! ✅
   - Testing for duplicate values and data integrity are a must to make sure the gem runs smoothly.

2. **Keep It Original:**
   - Your contributions should be original and crafted with care. We put a lot of love into this project, and we hope you will too! 💖
   - **No AI-generated data** and definitely **no direct copy-pasting** without some thoughtful formatting or adapting.
   - Whatever you add should fit within the French vibe we’ve got going here. At the very least, it should be written in French. 🇫🇷

3. **Update the README:**
   - Added something new? Awesome! Just don’t forget to update the `README.md` so others know how to use it (and that it exists!). 👀
   - Stick to the current format so everything stays neat and easy to follow.

4. **Relevance:**
   - We’ve had enough of lorem ipsum—Faussaire is both serious & fun but definitely not boring, and we’d love to keep it that way!
   - If you’re looking to practice or contribute, we recommend focusing on cultural themes like poets, quotes, sentence generators, specific brands, etc. We’re all about fun, business, and art here at Faussaire (even if the "crew" is currently...shhh, don’t tell anyone).
   - Got something interesting? Great! Just keep it in French... For now!
   - While our main focus is on French, we’re open to all kinds of topics and languages. And who knows, maybe a Greek version is on the horizon! Wink wink!

5. **Code Comments:**
   - Your code should be well-commented to ensure clarity and maintainability.
   - While we prefer code to be written in English (because it’s just good practice, and we actually love foreign languages), we’re totally cool with comments in French given the nature of the app. 

   ```ruby
   require 'yaml'

   module Faussaire
     class Music
       DATA_PATH = File.expand_path('../../../locale/fr.yml', __FILE__)

       ##
       # Fetches and samples data based on the provided key. If the fetched data is an array,
       # it samples a single item, otherwise returns the data directly.
       #
       # @param key [String] The dot-separated key used to access the data.
       # @return [Object, nil] The data fetched and optionally sampled.
       #
       def self.fetch(key)
         data = YAML.load_file(DATA_PATH)
         result = data.dig(*key.split('.'))
         result.is_a?(Array) ? result.sample : result
       end

       ##
       # Produces a random house song.
       #
       # @return [String]
       #
       # @example
       #   Faussaire::Music.house #=> "House is a feeling - LA Riots"
       #
       def self.house
         fetch('fr.faussaire.music.house')
       end

       ##
       # Produces a random French rap song.
       #
       # @return [String]
       #
       # @example
       #   Faussaire::Music.rap #=> "Onizuka - PNL"
       #
       def self.rap
         fetch('fr.faussaire.music.rap')
       end

       ##
       # Produces a random French variété song.
       #
       # @return [String]
       #
       # @example
       #   Faussaire::Music.variete #=> "Laisse tomber les filles - France Gall"
       #
       def self.variete
         fetch('fr.faussaire.music.variete')
       end
     end
   end
   ```

## How to Submit Your Contribution

1. Fork the repository and create your feature branch: `git checkout -b a-great-idea-from-toi`
2. Make your changes, ensuring you follow the guidelines above.
3. Commit your changes: `git commit -am 'Added set of ridiculous quotes from French politicians and/or French fashion brands'`
4. Push to the branch: `git push origin a-great-idea-from-toi`
5. Submit a pull request.

That’s it! We’re thrilled to see what you’ll add to Faussaire. Also, fun fact: The “Faussaire crew” currently consists of...well, just me. But hey, that means learning by doing is really a thing so keep going! Don't give up!

Merci beaucoup for helping out and making Faussaire even better!