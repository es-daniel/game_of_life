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

  describe '.init_generations' do
    context 'given zero params' do
      it 'should return an Integer' do
        expect(game.init_generations).to be_a(Integer)
      end

      it 'should initialize the number of generations' do
        expect(game.init_generations).to eq(game.generations)
      end

    end
  end

end