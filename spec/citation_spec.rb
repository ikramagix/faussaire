require 'spec_helper'
require 'faussaire/citation'

RSpec.describe Faussaire::Citation do

  describe '.no duplicate values' do
    context 'in philosophic quotes list' do
      let(:philoquotes) { Faussaire::Citation.send(:fetch, 'fr.faussaire.citation.philosophy') }

      it 'does not contain duplicates' do
        duplicates = philoquotes.select { |item| philoquotes.count(item) > 1 }.uniq
        expect(duplicates).to be_empty, "Found duplicates in philosophy : #{duplicates.join(', ')}"
      end

      it 'does not contain multiple consecutive spaces' do
        philoquotes.each do |quote|
          expect(quote).not_to match(/\s{2,}/), "Found multiple consecutive spaces in quote: #{quote}"
        end
      end

      it 'does not contain empty strings' do
        empty_quotes = philoquotes.select { |quote| quote.empty? }
        expect(empty_quotes).to be_empty, "Found empty strings in philosophy quotes"
      end
    end

    context 'in proverbs list' do
      let(:proverbs) { Faussaire::Citation.send(:fetch, 'fr.faussaire.citation.proverbe') }

      it 'does not contain duplicates' do
        duplicates = proverbs.select { |item| proverbs.count(item) > 1 }.uniq
        expect(duplicates).to be_empty, "Found duplicates in proverbs : #{duplicates.join(', ')}"
      end

      it 'does not contain multiple consecutive spaces' do
        proverbs.each do |proverb|
          expect(proverb).not_to match(/\s{2,}/), "Found multiple consecutive spaces in proverb: #{proverb}"
        end
      end
      
      it 'does not contain empty strings' do
        empty_proverbs = proverbs.select { |proverb| proverb.empty? }
        expect(empty_proverbs).to be_empty, "Found empty strings in proverbs"
      end
    end
  end
end