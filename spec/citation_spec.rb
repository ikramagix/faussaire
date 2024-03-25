require 'faussaire/citation'

RSpec.describe Faussaire::Citation do
  describe '.no duplicate values' do
    context 'in philosophic quotes list' do
      let(:philoquotes) { Faussaire::Citation.send(:fetch, 'fr.faussaire.citation.philosophy') }

      it 'does not contain duplicates' do
        duplicates = philoquotes.select { |item| philoquotes.count(item) > 1 }.uniq
        expect(duplicates).to be_empty, "Found duplicates in philosophy : #{duplicates.join(', ')}"
      end
    end
  end
end
