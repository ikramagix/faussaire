require 'spec_helper'
require 'faussaire/ancien'

RSpec.describe Faussaire::Ancien do
    describe '.creature' do
      let(:creatures) { Faussaire::Ancien.fetch('fr.faussaire.ancien.creature') }
      let(:creature) { Faussaire::Ancien.creature }
  
      it 'returns a string' do
        expect(creature).to be_a(String),
      end
  
      it 'returns a valid creature from the YAML list' do
        expect(creatures).to include(creature), "Expected creatures to include #{creature.inspect}, but it did not. Available creatures: #{creatures.inspect}"
      end
    end
  end
  