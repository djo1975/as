require 'rspec'
require_relative '../classes/game'

RSpec.describe Game do
  let(:game) { Game.new('2021-05-03', 'multiplayer', '2023-05-03') }

  context 'When Game is created' do
    it 'should have a player type' do
      expect(game.multiplayer).to eq('multiplayer')
    end

    it 'should have a last played date' do
      expect(game.last_played_at).to eq('2023-05-03')
    end

    it 'should be instance of' do
      expect(game).to be_instance_of(Game)
    end
  end
end
