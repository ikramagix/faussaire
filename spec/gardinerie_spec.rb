require 'spec_helper'
require 'faussaire/gardinerie'

RSpec.describe Faussaire::Gardinerie do
    describe '.vegetable' do
      it 'returns a string' do
        expect(Faussaire::Gardinerie.vegetable).to be_a(String)
      end
  
      it 'matches the expected format' do
        expect(Faussaire::Gardinerie.vegetable).to match(/\A.+ \(.+\)\z/)
      end
    end
  
    describe '.fruit' do
      it 'returns a string' do
        expect(Faussaire::Gardinerie.fruit).to be_a(String)
      end
  
      it 'matches the expected format' do
        expect(Faussaire::Gardinerie.fruit).to match(/\A.+ \(.+\)\z/)
      end
    end
  
    describe '.rival_plant' do
      it 'returns a string' do
        expect(Faussaire::Gardinerie.rival_plant).to be_a(String)
      end
    end

    describe '.bang_bang_plant' do
      it 'returns a string' do
        expect(Faussaire::Gardinerie.bang_bang_plant).to be_a(String)
      end
    end
  
    describe '.very_naughty_plant' do
      it 'returns a string' do
        expect(Faussaire::Gardinerie.very_naughty_plant).to be_a(String)
      end
    end

  describe '.no duplicate values' do
    context 'in vegetable list' do
      let(:vegetables) { Faussaire::Gardinerie.send(:fetch, 'fr.faussaire.gardinerie.potager') }

      it 'does not contain duplicates' do
        duplicates = vegetables.select { |item| vegetables.count(item) > 1 }.uniq
        expect(duplicates).to be_empty, "Found duplicates in vegetables : #{duplicates.join(', ')}"
      end
    end

    context 'in fruit list' do
      let(:fruits) { Faussaire::Gardinerie.send(:fetch, 'fr.faussaire.gardinerie.verger') }

      it 'does not contain duplicates' do
        duplicates = fruits.select { |item| fruits.count(item) > 1 }.uniq
        expect(duplicates).to be_empty, "Found duplicates in fruits : #{duplicates.join(', ')}"
      end
    end

    context 'in rival plant list' do
      let(:rival_plants) { Faussaire::Gardinerie.send(:fetch, 'fr.faussaire.gardinerie.rival_plant') }

      it 'does not contain duplicates' do
        duplicates = rival_plants.select { |item| rival_plants.count(item) > 1 }.uniq
        expect(duplicates).to be_empty, "Found duplicates in rival plants : #{duplicates.join(', ')}"
      end
    end

    context 'in bang bang plant list' do
      let(:bang_bang_plants) { Faussaire::Gardinerie.send(:fetch, 'fr.faussaire.gardinerie.bang_bang_plant') }

      it 'does not contain duplicates' do
        duplicates = bang_bang_plants.select { |item| bang_bang_plants.count(item) > 1 }.uniq
        expect(duplicates).to be_empty, "Found duplicates in bang bang plants : #{duplicates.join(', ')}"
      end
    end

    context 'in very naughty plant list' do
      let(:very_naughty_plants) { Faussaire::Gardinerie.send(:fetch, 'fr.faussaire.gardinerie.very_naughty_plant') }

      it 'does not contain duplicates' do
        duplicates = very_naughty_plants.select { |item| very_naughty_plants.count(item) > 1 }.uniq
        expect(duplicates).to be_empty, "Found duplicates in very naughty plants : #{duplicates.join(', ')}"
      end
    end
  end
end
