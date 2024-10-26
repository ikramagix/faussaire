require 'spec_helper'
require 'yaml'
require 'faussaire/piraterie'

RSpec.describe Faussaire::Music do
  before(:all) do
    @data = YAML.load_file(File.expand_path('../locale/fr.yml', __dir__))
  end

  describe '.no duplicate values' do
    context 'in roles list' do
      it 'does not contain duplicates' do
        roles = @data.dig('fr', 'faussaire', 'piraterie', 'role')
        unique_roles = roles.uniq

        duplicates = roles.group_by { |role| role }.select { |_, v| v.size > 1 }.keys

        expect(duplicates).to be_empty, "Duplicates found in piraterie roles: #{duplicates.join(', ')}"
      end
    end
  end
end
