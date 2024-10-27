require 'yaml'

module Faussaire
  class Piraterie
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
    # Produces a random The Hacking Project learner status.
    #
    # @return [String]
    #
    # @example
    #   Faussaire::Piraterie.role #=> "Moussaillon"
    #
    def self.role
      fetch('fr.faussaire.piraterie.role')
    end

    ##
    # Produces a random pirate-themed status not used in the Hacking Project.
    #
    # @return [String]
    #
    # @example
    #   Faussaire::Piraterie.pnj #=> "Siresse"
    #
    def self.pnj
      fetch('fr.faussaire.piraterie.pnj')
    end

    ##
    # Produces a random pirate boat type.
    #
    # @return [String]
    #
    # @example
    #   Faussaire::Piraterie.nav #=> "Frégate"
    #
    def self.nav
      fetch('fr.faussaire.piraterie.nav')
    end
    
    ##
    # Produces a random pirate swearing.
    #
    # @return [String]
    #
    # @example
    #   Faussaire::Piraterie.rage #=> "Mille millions de mille sabords !"
    #
    def self.rage
      fetch('fr.faussaire.piraterie.rage')
    end

    ##
    # Produces a random excuse for not delivering a project or being absent.
    #
    # @return [String]
    #
    # @example
    #   Faussaire::Piraterie.excuse #=> "Les embruns de la mer de Frêche m'ont rendu un peu fébrile… ai-je droit à un peu de repos Capitaine ?"
    #
    def self.excuse
      fetch('fr.faussaire.piraterie.excuse')
    end

    ##
    # Produces a random made-up gossip about The Hacking Project experience.
    #
    # @return [String]
    #
    # @example
    #   Faussaire::Piraterie.potin #=> "Il paraît qu’un moussaillon préfère naviguer en eaux troubles avec des commits non testés !"
    #
    def self.potin
      fetch('fr.faussaire.piraterie.potin')
    end
  end
end
