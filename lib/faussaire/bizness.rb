require 'yaml'

module Faussaire
  class Bizness
    DATA_PATH = File.expand_path('../../../locale/fr.yml', __FILE__)

    def self.fetch(key)
      data = YAML.load_file(DATA_PATH)
      data.dig(*key.split('.'))
    end

    def self.brands
      fetch('fr.faussaire.bizness.brands')
    end

    def self.pipotronic
      phrases = fetch('fr.faussaire.bizness.pipotronics')
      return unless phrases.is_a?(Array)

      formatted_sentence = format(phrases.sample(7)) # Suppose we build a sentence with 7 parts
      formatted_sentence
    end

    private

    def self.format(arr)
        vowels = "aeiouyhéèà"
        arr.each_with_index do |word, i|
          next if word.nil?
      
          if word.end_with?('#')
            arr[i] = word.chop # Remove the last character
            # Check if arr[i + 1] is nil before accessing its first character
            if arr[i + 1].nil?
              arr[i] += "'"
            else
              arr[i] += vowels.include?(arr[i + 1][0].downcase) ? 'e ' : "'"
            end
          elsif word.end_with?("'") || (word.include?('#') && word[-3..-1] == "de ")
            arr[i] = arr[i][0...-1] # Adjust slicing
            # Check if arr[i + 1] is nil before accessing its first character
            if arr[i + 1].nil?
              arr[i] += "'"
            else
              arr[i] += vowels.include?(arr[i + 1][0].downcase) ? 'e ' : "'"
            end
          end
      
          arr[i] += ' ' unless arr[i].end_with?(' ', "'") || i == arr.size - 1
          arr[i] = 'les ' + arr[i] if i == 5 # Specific logic for the sixth element
        end
      
        arr.join.squeeze(' ').strip
      end
    end 
end
