# frozen_string_literal: true

require 'spec_helper'
require 'faussaire/name'

RSpec.describe Faussaire::Name do
  describe '.female_first_name' do
    it 'returns a female first name' do
      expect(Faussaire::Name.female_first_name).to be_a(String)
    end

    it 'returns a different female first name on each call' do
      name1 = Faussaire::Name.female_first_name
      name2 = Faussaire::Name.female_first_name

      expect(name1).not_to eq(name2)
    end
  end

  describe '.male_first_name' do
    it 'returns a male first name' do
      expect(Faussaire::Name.male_first_name).to be_a(String)
    end

    it 'returns a different male first name on each call' do
      name1 = Faussaire::Name.male_first_name
      name2 = Faussaire::Name.male_first_name

      expect(name1).not_to eq(name2)
    end
  end

  describe '.family_name' do
    it 'returns a family name' do
      expect(Faussaire::Name.family_name).to be_a(String)
    end

    it 'returns a different family name on each call' do
      family_name1 = Faussaire::Name.family_name
      family_name2 = Faussaire::Name.family_name

      expect(family_name1).not_to eq(family_name2)
    end
  end

  describe '.name' do
    it 'returns a full name' do
      expect(Faussaire::Name.name).to be_a(String)
    end

    it 'returns a different full name on each call' do
      full_name1 = Faussaire::Name.name
      full_name2 = Faussaire::Name.name

      expect(full_name1).not_to eq(full_name2)
    end

    it 'checks the uniqueness of every occurrence' do
      generated_names = []

      10.times do
        full_name = Faussaire::Name.name

        expect(full_name).not_to be_empty

        expect(generated_names).not_to include(full_name)
        generated_names << full_name
      end
    end

    it 'returns unique names when called multiple times' do
      names = 15.times.map { Faussaire::Name.name }

      expect(names).to all(be_a(String)).and all(be_truthy)
      expect(names).to eq(names.uniq)
    end
  end
end
