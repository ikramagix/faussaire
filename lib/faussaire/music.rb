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
