require 'spec_helper'
require 'faussaire/cosmos'

RSpec.describe Faussaire::Cosmos do
  let(:cosmos_data) { YAML.load_file(Faussaire::Cosmos::DATA_PATH) }

  describe '.no duplicate values' do
    context 'in cosmos planet list' do
      let(:planets) { cosmos_data['fr']['faussaire']['cosmos']['planet'] }

      it 'does not contain duplicates' do
        expect(planets.uniq.count).to eq(planets.count), "Found duplicates in planets: #{planets.group_by(&:itself).select { |k,v| v.size > 1 }.keys.join(', ')}"
      end

      it 'does not contain multiple consecutive spaces' do
        planets.each do |planet|
          expect(planet).not_to match(/\s{2,}/), "Found multiple consecutive spaces in planet name: #{planet}"
        end
      end

      it 'does not contain empty strings' do
        expect(planets).not_to include(''), "Found empty strings in planet names"
      end
    end

    context 'in cosmos neighborhood list' do
      let(:neighborhood) { cosmos_data['fr']['faussaire']['cosmos']['neighborhood'] }

      it 'does not contain duplicates' do
        expect(neighborhood.uniq.count).to eq(neighborhood.count), "Found duplicates in cosmos neighborhood: #{neighborhood.group_by(&:itself).select { |k,v| v.size > 1 }.keys.join(', ')}"
      end

      it 'does not contain multiple consecutive spaces' do
        neighborhood.each do |neighborhood|
          expect(neighborhood).not_to match(/\s{2,}/), "Found multiple consecutive spaces in neighborhood name: #{neighborhood}"
        end
      end

      it 'does not contain empty strings' do
        expect(neighborhood).not_to include(''), "Found empty strings in planet names"
      end
    end

    context 'in comsmic exploration list' do
      let(:exploration) { cosmos_data['fr']['faussaire']['cosmos']['exploration'] }

      it 'does not contain duplicates' do
        expect(exploration.uniq.count).to eq(exploration.count), "Found duplicates in cosmos exploration: #{exploration.group_by(&:itself).select { |k,v| v.size > 1 }.keys.join(', ')}"
      end

      it 'does not contain multiple consecutive spaces' do
        exploration.each do |exploration|
          expect(exploration).not_to match(/\s{2,}/), "Found multiple consecutive spaces in neighborhood name: #{exploration}"
        end
      end

      it 'does not contain empty strings' do
        expect(exploration).not_to include(''), "Found empty strings in planet names"
      end
    end

    context 'in cosmos event list' do
      let(:events) { cosmos_data['fr']['faussaire']['cosmos']['event'] }

      it 'does not contain duplicates' do
        expect(events.uniq.count).to eq(events.count), "Found duplicates in cosmic events: #{events.group_by(&:itself).select { |k,v| v.size > 1 }.keys.join(', ')}"
      end

      it 'does not contain multiple consecutive spaces' do
        events.each do |event|
          expect(event).not_to match(/\s{2,}/), "Found multiple consecutive spaces in cosmic event: #{event}"
        end
      end

      it 'does not contain empty strings' do
        expect(events).not_to include(''), "Found empty strings in cosmic events"
      end
    end
  end
end
