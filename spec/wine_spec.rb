require 'spec_helper'
require 'faussaire/wine'

RSpec.describe Faussaire::Wine do
    shared_examples 'a valid string attribute' do |method|
      it "returns a non-empty string for #{method}" do
        result = Faussaire::Wine.send(method)
        expect(result).to be_a(String)
        expect(result).not_to be_empty
        expect(result.encoding.name).to eq("UTF-8")
        expect(result.valid_encoding?).to be(true)
      end
    end
  
    describe 'wine attributes' do
      [:name, :type, :bottle_type, :region, :licocorico].each do |method|
        include_examples 'a valid string attribute', method
      end
    end
  
    describe '.price' do
      let(:prices) { Array.new(1000) { Faussaire::Wine.price.delete('€').to_f } }
      
      it 'returns a string that matches the expected format' do
        expect(Faussaire::Wine.price).to match(/\A\d+\.99€\z/)
      end
  
      # Testing distribution
      it 'adheres to the specified probability distribution' do
        ranges = {
          (3.5..499) => 0.5,
          (500..2999) => 0.35,
          (3000..301300) => 0.1,
          (301301..482000) => 0.05
        }
        counts = Hash.new(0)
  
        prices.each do |price|
          range = ranges.keys.find { |range| range.include?(price) }
          counts[range] += 1
        end
  
        ranges.each do |range, expected_prob|
          actual_prob = counts[range].to_f / prices.size
          expect(actual_prob).to be_within(0.05).of(expected_prob)
        end
      end
    end
    
    describe '.name' do
        it 'demonstrates randomness by returning a diverse set of names' do
          # Generate a large number of names
          names = Array.new(98) { Faussaire::Wine.name }
          
          # Check for a reasonable number of unique names to assert randomness
          unique_names = names.uniq
          expect(unique_names.size).to be > 20 # Arbitrary threshold, adjust based on expected diversity
        end
      end
      
      describe '.type' do
        it 'demonstrates randomness by returning a diverse set of types' do
          types = Array.new(98) { Faussaire::Wine.type }.uniq
          expect(types.size).to be > 1
        end
      end
    
      describe '.bottle_type' do
        it 'demonstrates randomness by returning a diverse set of bottle types' do
          bottle_types = Array.new(98) { Faussaire::Wine.bottle_type }.uniq
          expect(bottle_types.size).to be > 1
        end
      end
    
      describe '.region' do
        it 'demonstrates randomness by returning a diverse set of regions' do
          regions = Array.new(98) { Faussaire::Wine.region }.uniq
          expect(regions.size).to be > 1
        end
      end
    
      describe '.licocorico' do
        it 'demonstrates randomness by returning a diverse set of licocorico' do
          licocoricos = Array.new(98) { Faussaire::Wine.licocorico }.uniq
          expect(licocoricos.size).to be > 1
        end
      end    
  end