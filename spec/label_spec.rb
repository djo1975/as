require 'rspec'
require_relative '../classes/label'
require_relative '../classes/item'

describe Label do
  let(:color) { 'white' }
  let(:title) { 'Penguin' }
  let(:label) { Label.new(title, color) }

  describe '#initialize' do
    it 'sets color and title' do
      expect(label.color).to eq('white')
      expect(label.title).to eq('Penguin')
    end
  end
  describe '#add_item' do
    it 'adds an item to the label' do
      item = Item.new('NewItem')
      label.add_item(item)
      expect(label.items).to include(item)
      expect(item.label).to eq(label)
    end
  end
end
