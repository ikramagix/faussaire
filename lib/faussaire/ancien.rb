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

    def self.historical_figure
        fetch('fr.faussaire.ancien.historical_figure').sample
    end
  end
end
