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

  describe '.draw' do
    context 'given  zero params' do
      it 'draw the current colony' do
        expect(game.draw).to be_a(Array)
      end
    end
  end

  describe '.rand_living_cell' do
    context 'given an array of cells' do
      it 'should accept an Array argument' do
        expect(game).to receive(:rand_living_cell).with(an_instance_of(Array))
        game.rand_living_cell(%w[▢ ▢ ▢ ▢ ▢ ▢ ▢ ▢ ▢])
      end
    end
  end
end