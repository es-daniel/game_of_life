require 'game_of_life'

describe GameOfLife do
  let(:game) { GameOfLife.new }

  describe '.initialize' do
    context 'given zero params' do
      it 'creates a new GameOfLife object' do
        expect(game).to be_a(GameOfLife)
      end
    end
  end

end