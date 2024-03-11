require 'yaml'

module Faussaire
  class Tv
    DATA_PATH = File.expand_path('../../../locale/fr.yml', __FILE__)

    def self.fetch(key)
    data = YAML.load_file(DATA_PATH)
    data.dig(*key.split('.'))
    end

    def self.shows
      fetch('fr.faussaire.tv.show').sample
    end
  end
end