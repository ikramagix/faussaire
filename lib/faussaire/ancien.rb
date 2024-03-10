require 'yaml'

module Faussaire
  class Ancien
    DATA_PATH = File.expand_path('../../../locale/fr.yml', __FILE__)

    def self.fetch(key)
      data = YAML.load_file(DATA_PATH)
      data.dig(*key.split('.'))
    end

    def self.creature
        fetch('fr.faussaire.ancien.creature').sample
    end

    def self.historic_figure
        fetch('fr.faussaire.ancien.historic_figure').sample
    end

    def self.words
      fetch('fr.faussaire.ancien.words')
    end
  end
end
