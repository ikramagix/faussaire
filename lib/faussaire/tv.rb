require 'yaml'

module Faussaire
  class Tv
    DATA_PATH = File.expand_path('../../../locale/fr.yml', __FILE__)

    module FestivalCannes
      class << self
        def total_films
          festival_cannes_data['total_films'].first
        end

        def most_represented_countries
          festival_cannes_data['most_represented_countries'].sample
        end

        def awarded_countries
          festival_cannes_data['awarded_countries'].sample
        end

        def directors_with_two_palms
          festival_cannes_data['directors_with_two_palms'].sample
        end

        def multiple_awardises
          festival_cannes_data['multiple_awardises'].sample
        end

        def winners
          festival_cannes_data['winners'].sample
        end

        private

        def festival_cannes_data
          fetch('fr.faussaire.tv.festival_cannes')
        end

        def fetch(key)
          data = YAML.load_file(Faussaire::Tv::DATA_PATH)
          data.dig(*key.split('.'))
        end
      end
    end

    def self.fetch(key)
      data = YAML.load_file(DATA_PATH)
      data.dig(*key.split('.'))
    end

    def self.festival_cannes
      FestivalCannes
    end

    def self.show
      fetch('fr.faussaire.tv.show').sample
    end

    def self.influencer
      fetch('fr.faussaire.tv.influencer').sample
    end

    def self.famous_couples
      fetch('fr.faussaire.tv.famous_couples').sample
    end

    def self.channel
      fetch('fr.faussaire.tv.channel').sample
    end
  end
end
