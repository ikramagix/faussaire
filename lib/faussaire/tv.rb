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
  end
end