require 'rspec'
require_relative '../classes/author'
require_relative '../classes/game'

RSpec.describe Author do
  let(:author) { Author.new('Tom', 'Cruise') }
  let(:game) { Game.new('2021-05-03', 'multiplayer', '2023-05-03') }

  context 'When Author is created' do
    it 'should be an instance of Author' do
      expect(author).to be_an_instance_of(Author)
    end

    it 'should have a first name' do
      expect(author.first_name).to eq('Tom')
    end

    it 'should have a last name' do
      expect(author.last_name).to eq('Cruise')
    end

    it 'should have an id' do
      expect(author.id).to be_between(1, 2000)
    end

    it 'should have an empty array of items' do
      expect(author.items).to eq([])
    end
  end

  describe '#add_item' do
    it 'add game item to author' do
      author.add_item(game)
      expect(author.items).to include(game)
    end

    it 'game item should have author' do
      author.add_item(game)
      expect(game.author).to eq(author)
    end

    it 'does not duplicate items' do
      author.add_item(game)
      author.add_item(game)
      expect(game.author).to eq(author)
    end
  end
end
