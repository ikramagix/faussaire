require 'spec_helper'
require 'faussaire/creamerie'

RSpec.describe Faussaire::Creamerie do
  describe '.milk_type' do
    it 'returns a string' do
      expect(Faussaire::Creamerie.milk_type).to be_a(String)
    end
  end

  describe '.butter' do
    it 'returns a string' do
      expect(Faussaire::Creamerie.butter).to be_a(String)
    end
  end

  describe '.cream' do
    it 'returns a string' do
      expect(Faussaire::Creamerie.cream).to be_a(String)
    end
  end

  describe '.cheese' do
    it 'returns a hash with :type, :name, and :region keys' do
      cheese = Faussaire::Creamerie.cheese
      expect(cheese).to be_a(Hash)
      expect(cheese.keys).to contain_exactly(:type, :name, :region)
    end

    it 'returns strings for cheese type, name, and region' do
      cheese = Faussaire::Creamerie.cheese
      expect(cheese[:type]).to be_a(String)
      expect(cheese[:name]).to be_a(String)
      expect(cheese[:region]).to be_a(String)
    end
  end
end
