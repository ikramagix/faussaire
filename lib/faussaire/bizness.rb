require 'yaml'

module Faussaire
  class Bizness
    DATA_PATH = File.expand_path('../../../locale/fr.yml', __FILE__)

    def self.fetch(key)
    data = YAML.load_file(DATA_PATH)
    data.dig(*key.split('.'))
    end

    def self.brands
      fetch('fr.faussaire.bizness.brands').sample
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
        # Identifier si le mot actuel se termine par '#' et le traiter.
        if phrase[-1] == '#'
          phrase.chop! # Supprimer le dernier caractère '#'
          next_phrase_starts_with_vowel = i < arr.size - 1 && vowels.include?(arr[i + 1][0].downcase)
          arr[i] += next_phrase_starts_with_vowel ? 'e ' : "'"
        end
    
        # Traiter les cas où le mot se termine par '\'' ou contient 'de ' nécessitant une décision sur l'ajout de 'e ' ou de ''.
        if phrase[-1] == '\'' || (phrase.include?('de') && phrase[-3..] == "de ")
          # Aucun besoin de couper le mot ici; ajustez simplement pour le suivant.
          next_phrase_starts_with_vowel = i < arr.size - 1 && vowels.include?(arr[i + 1][0].downcase)
          arr[i] += next_phrase_starts_with_vowel ? 'e ' : ""
        end
    
        # Ajouter un espace si nécessaire.
        arr[i] += ' ' unless arr[i].end_with?(' ', "'") || i == arr.size - 1
        # Traitement spécial pour le sixième élément, si nécessaire.
        arr[i] = 'les ' + arr[i] if i == 5
      end
      # Construire la phrase et ajouter un point à la fin.
      sentence = arr.join.squeeze(' ').strip + '.'
      sentence
    end
  end
end