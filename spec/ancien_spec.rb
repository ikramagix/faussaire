require 'faussaire/ancien'

RSpec.describe Faussaire::Ancien do
  let(:creature) { Faussaire::Ancien.creature }
  let(:historic_figure) { Faussaire::Ancien.historic_figure }
  let(:words) { Faussaire::Ancien.words }

  describe '.creature' do
    it 'returns a string' do
      expect(creature).to be_a(String)
    end
  end

  describe '.historic_figure' do
    it 'returns a string' do
      expect(historic_figure).to be_a(String)
    end
  end

  describe '.words' do
    it 'returns a string' do
      expect(words).to be_a(String)
    end
  end

  describe 'verification of no duplicates and validations' do
    # Loading full arrays for validation purposes
    let(:all_creatures) { YAML.load_file(Faussaire::Ancien::DATA_PATH).dig('fr', 'faussaire', 'ancien', 'creature') }
    let(:all_historic_figures) { YAML.load_file(Faussaire::Ancien::DATA_PATH).dig('fr', 'faussaire', 'ancien', 'historic_figure') }
    let(:all_words) { YAML.load_file(Faussaire::Ancien::DATA_PATH).dig('fr', 'faussaire', 'ancien', 'words') }

    it 'creatures list does not contain duplicates' do
      expect(all_creatures.uniq.size).to eq(all_creatures.size)
    end

    it 'historic figures list does not contain duplicates' do
      expect(all_historic_figures.uniq.size).to eq(all_historic_figures.size)
    end

    it 'words list does not contain duplicates' do
      expect(all_words.uniq.size).to eq(all_words.size)
    end

    it 'words do not contain invalid characters or formats' do
      invalid_words = all_words.select { |word| word.include?('*') || word.match?(/^\d+\./) || word.include?('(se)') }
      expect(invalid_words).to be_empty
    end
  end
end
