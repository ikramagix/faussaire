require 'yaml'

module Faussaire
  class Tv
    DATA_PATH = File.expand_path('../../../locale/fr.yml', __FILE__)

    def self.fetch(key)
    data = YAML.load_file(DATA_PATH)
    data.dig(*key.split('.'))
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

    def self.projected_films
      fetch('fr.faussaire.tv.festival_cannes.projected_films').first
    end

    def self.most_represented_countries
      fetch('fr.faussaire.tv.festival_cannes.most_represented_countries')
    end

    def self.palms_by_country
      fetch('fr.faussaire.tv.festival_cannes.palms_by_country')
    end
  end
end