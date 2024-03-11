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

    def self.load_dico
      data = YAML.load_file(DATA_PATH)
      dico = data.dig('fr', 'faussaire', 'bizness', 'pipotronics')
      dico
    end

    def self.pipotronic
      dico = load_dico
      selected_phrases = dico.map { |category| category.sample }
      format(selected_phrases)
    end

    def self.format(arr)
      vowels = "aeiouyhéèà"
      arr.each_with_index do |phrase, i|
        if phrase[-1] == '#'
          phrase.chop!
          next_phrase_starts_with_vowel = vowels.include?(arr[i + 1][0].downcase)
          arr[i] += next_phrase_starts_with_vowel ? 'e ' : "'"
        elsif phrase[-1] == '\'' || (phrase.include?('#') && phrase[-3..] == "de ")
          arr[i] = phrase[0...-1]
          next_phrase_starts_with_vowel = vowels.include?(arr[i + 1][0].downcase)
          arr[i] += next_phrase_starts_with_vowel ? 'e ' : "'"
        end

        arr[i] += ' ' unless arr[i].end_with?(' ', "'") || i == arr.size - 1
        arr[i] = 'les ' + arr[i] if i == 5
      end
      arr.join.squeeze(' ').strip
    end
  end
end