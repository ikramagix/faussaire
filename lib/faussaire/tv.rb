require 'yaml'

module Faussaire
  class Tv
    DATA_PATH = File.expand_path('../../../locale/fr.yml', __FILE__)

    # Provides data related to the Festival de Cannes.
    module FestivalCannes
      class << self
        ##
        # Returns the total number of films presented at the festival.
        #
        # @return [Integer]
        #
        # @example
        #   Faussaire::Tv::FestivalCannes.total_films #=> 3200
        #
        def total_films
          festival_cannes_data['total_films'].first
        end

        ##
        # Produces a random country among the most represented at the festival.
        #
        # @return [String]
        #
        # @example
        #   Faussaire::Tv::FestivalCannes.most_represented_countries #=> "France"
        #
        def most_represented_countries
          fetch('fr.faussaire.tv.festival_cannes.most_represented_countries')
        end

        ##
        # Produces a random country from those that have won awards.
        #
        # @return [String]
        #
        # @example
        #   Faussaire::Tv::FestivalCannes.awarded_countries #=> "USA"
        #
        def awarded_countries
          fetch('fr.faussaire.tv.festival_cannes.awarded_countries')
        end

        ##
        # Produces a random director who has won the Palme d'Or twice.
        #
        # @return [String]
        #
        # @example
        #   Faussaire::Tv::FestivalCannes.directors_with_two_palms #=> "Quentin Tarantino"
        #
        def directors_with_two_palms
          fetch('fr.faussaire.tv.festival_cannes.directors_with_two_palms')
        end

        ##
        # Produces a random nominee who has received multiple awards.
        #
        # @return [String]
        #
        # @example
        #   Faussaire::Tv::FestivalCannes.multiple_awardises #=> "Meryl Streep"
        #
        def multiple_awardises
          fetch('fr.faussaire.tv.festival_cannes.multiple_awardises')
        end

        ##
        # Produces a random Palme d'Or winner.
        #
        # @return [String]
        #
        # @example
        #   Faussaire::Tv::FestivalCannes.winners #=> "Parasite"
        #
        def winners
          fetch('fr.faussaire.tv.festival_cannes.winners')
        end

        ##
        # Returns a random top box office figure from the festival's films.
        #
        # @return [String] The box office amount in USD.
        #
        # @example
        #   Faussaire::Tv::FestivalCannes.box_office #=> "$500 million"
        #
        def box_office
          fetch('fr.faussaire.tv.festival_cannes.box_office')
        end

        private

        def festival_cannes_data
          fetch('fr.faussaire.tv.festival_cannes')
        end

        def fetch(key)
          data = YAML.load_file(Faussaire::Tv::DATA_PATH)
          result = data.dig(*key.split('.'))
          result.is_a?(Array) ? result.sample : result
        end
      end
    end

    ##
    # Fetches and samples data from the YAML file based on the provided key.
    # If the data is an array, it samples a single item.
    #
    # @param key [String] The dot-separated key used to access the data.
    # @return [Object, nil] The data fetched and optionally sampled.
    #
    def self.fetch(key)
      data = YAML.load_file(DATA_PATH)
      result = data.dig(*key.split('.'))
      result.is_a?(Array) ? result.sample : result
    end

    def self.festival_cannes
      FestivalCannes
    end

    ##
    # Produces a random television show title.
    #
    # @return [String]
    #
    # @example
    #   Faussaire::Tv.show #=> "Game of Thrones"
    #
    def self.show
      fetch('fr.faussaire.tv.show')
    end

    ##
    # Produces a random famous influencer's name.
    #
    # @return [String]
    #
    # @example
    #   Faussaire::Tv.influencer #=> "Kim Kardashian"
    #
    def self.influencer
      fetch('fr.faussaire.tv.influencer')
    end

    ##
    # Produces a random famous couple from television.
    #
    # @return [String]
    #
    # @example
    #   Faussaire::Tv.famous_couples #=> "Ross and Rachel"
    #
    def self.famous_couples
      fetch('fr.faussaire.tv.famous_couples')
    end

    ##
    # Produces a random TV channel name.
    #
    # @return [String]
    #
    # @example
    #   Faussaire::Tv.channel #=> "HBO"
    #
    def self.channel
      fetch('fr.faussaire.tv.channel')
    end
  end
end
