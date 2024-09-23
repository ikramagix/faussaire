require 'spec_helper'
require 'yaml'
require 'faussaire/music'

RSpec.describe Faussaire::Music do
  before(:all) do
    @data = YAML.load_file(File.expand_path('../locale/fr.yml', __dir__))
  end

  describe '.no duplicate values' do
    context 'in rap list' do
      it 'does not contain duplicates' do
        rap_songs = @data.dig('fr', 'faussaire', 'music', 'rap')
        unique_songs = rap_songs.uniq

        duplicates = rap_songs.group_by { |song| song }.select { |_, v| v.size > 1 }.keys

        expect(duplicates).to be_empty, "Duplicates found in rap songs: #{duplicates.join(', ')}"
      end
    end

    context 'in variete list' do
      it 'does not contain duplicates' do
        variete_songs = @data.dig('fr', 'faussaire', 'music', 'variete')
        unique_songs = variete_songs.uniq

        duplicates = variete_songs.group_by { |song| song }.select { |_, v| v.size > 1 }.keys

        expect(duplicates).to be_empty, "Duplicates found in variete songs: #{duplicates.join(', ')}"
      end
    end

    context 'in house list' do
      it 'does not contain duplicates' do
        house_songs = @data.dig('fr', 'faussaire', 'music', 'house')
        unique_songs = house_songs.uniq

        duplicates = house_songs.group_by { |song| song }.select { |_, v| v.size > 1 }.keys

        expect(duplicates).to be_empty, "Duplicates found in house songs: #{duplicates.join(', ')}"
      end
    end
  end
end
