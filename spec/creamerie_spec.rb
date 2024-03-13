# spec/creamerie_spec.rb
require 'spec_helper'
require 'faussaire/creamerie'

RSpec.describe Faussaire::Creamerie do
  shared_examples 'a valid category' do |method, expected_class|
    it "#{method} returns an string of #{expected_class}" do
      expect(Faussaire::Creamerie.send(method)).to be_an(String)
      expect(Faussaire::Creamerie.send(method).first).to be_a(expected_class) unless Faussaire::Creamerie.send(method).empty?
    end
  end

  describe 'milk_type' do
    it_behaves_like 'a valid category', :milk_type, String
  end

  describe 'butter' do
    it_behaves_like 'a valid category', :butter, String
  end

  describe 'cream' do
    it_behaves_like 'a valid category', :cream, String
  end

  describe 'cheese' do
    it 'returns a hash with keys :type, :name, :region' do
      expect(Faussaire::Creamerie.cheese).to all(be_a(Hash))
      expect(Faussaire::Creamerie.cheese.first.keys).to include(:type, :name, :region)
    end

    it 'cheese types, names, and regions are strings' do
      cheese = Faussaire::Creamerie.cheese.first
      expect(cheese[:type]).to be_a(String)
      expect(cheese[:name]).to be_a(String)
      expect(cheese[:region]).to be_a(String)
    end
  end
end
