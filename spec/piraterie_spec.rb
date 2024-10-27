require 'spec_helper'
require 'yaml'
require 'faussaire/piraterie'

RSpec.describe Faussaire::Piraterie do
  before(:all) do
    @data = YAML.load_file(File.expand_path('../locale/fr.yml', __dir__))
  end

  describe 'Data structure and uniqueness validations' do
    context 'in roles list' do
      it 'does not contain duplicates' do
        roles = @data.dig('fr', 'faussaire', 'piraterie', 'role')
        unique_roles = roles.uniq
        duplicates = roles.group_by { |role| role }.select { |_, v| v.size > 1 }.keys

        expect(duplicates).to be_empty, "Duplicates found in piraterie roles: #{duplicates.join(', ')}"
      end

      it 'contains only strings and each role is capitalized' do
        roles = @data.dig('fr', 'faussaire', 'piraterie', 'role')
        expect(roles).to all(be_a(String))
        expect(roles).to all(match(/\A[A-Z]/))
      end
    end

    context 'in pnj list' do
      it 'does not contain duplicates' do
        pnjs = @data.dig('fr', 'faussaire', 'piraterie', 'pnj')
        duplicates = pnjs.group_by { |pnj| pnj }.select { |_, v| v.size > 1 }.keys

        expect(duplicates).to be_empty, "Duplicates found in piraterie pnj: #{duplicates.join(', ')}"
      end
    end

    context 'in nav list' do
      it 'does not contain duplicates' do
        navs = @data.dig('fr', 'faussaire', 'piraterie', 'nav')
        duplicates = navs.group_by { |nav| nav }.select { |_, v| v.size > 1 }.keys

        expect(duplicates).to be_empty, "Duplicates found in piraterie nav: #{duplicates.join(', ')}"
      end
    end

    context 'in rage list' do
      it 'does not contain duplicates' do
        rages = @data.dig('fr', 'faussaire', 'piraterie', 'rage')
        duplicates = rages.group_by { |rage| rage }.select { |_, v| v.size > 1 }.keys

        expect(duplicates).to be_empty, "Duplicates found in piraterie rage: #{duplicates.join(', ')}"
      end
    end

    context 'in excuse list' do
      it 'does not contain duplicates' do
        excuses = @data.dig('fr', 'faussaire', 'piraterie', 'excuse')
        duplicates = excuses.group_by { |excuse| excuse }.select { |_, v| v.size > 1 }.keys

        expect(duplicates).to be_empty, "Duplicates found in piraterie excuse: #{duplicates.join(', ')}"
      end
    end

    context 'in potin list' do
      it 'does not contain duplicates' do
        potins = @data.dig('fr', 'faussaire', 'piraterie', 'potin')
        duplicates = potins.group_by { |potin| potin }.select { |_, v| v.size > 1 }.keys

        expect(duplicates).to be_empty, "Duplicates found in piraterie potin: #{duplicates.join(', ')}"
      end
    end
  end

  describe 'Method return validations' do
    it 'produces a random role from roles list' do
      role = Faussaire::Piraterie.role
      roles = @data.dig('fr', 'faussaire', 'piraterie', 'role')
      expect(roles).to include(role)
    end

    it 'produces a random pnj from pnj list' do
      pnj = Faussaire::Piraterie.pnj
      pnjs = @data.dig('fr', 'faussaire', 'piraterie', 'pnj')
      expect(pnjs).to include(pnj)
    end

    it 'produces a random nav type from nav list' do
      nav = Faussaire::Piraterie.nav
      navs = @data.dig('fr', 'faussaire', 'piraterie', 'nav')
      expect(navs).to include(nav)
    end

    it 'produces a random rage from rage list' do
      rage = Faussaire::Piraterie.rage
      rages = @data.dig('fr', 'faussaire', 'piraterie', 'rage')
      expect(rages).to include(rage)
    end

    it 'produces a random excuse from excuse list' do
      excuse = Faussaire::Piraterie.excuse
      excuses = @data.dig('fr', 'faussaire', 'piraterie', 'excuse')
      expect(excuses).to include(excuse)
    end

    it 'produces a random gossip (potin) from potin list' do
      potin = Faussaire::Piraterie.potin
      potins = @data.dig('fr', 'faussaire', 'piraterie', 'potin')
      expect(potins).to include(potin)
    end
  end
end