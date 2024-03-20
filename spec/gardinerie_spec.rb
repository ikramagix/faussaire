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
  end
  