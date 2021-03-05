require 'game_of_life'

describe GameOfLife do
  describe '.initialize' do
    context 'given zero params' do
      it 'creates a new GameOfLife object' do
        expect(GameOfLife.new).to be_a(GameOfLife)
      end
    end
  end

  describe '.draw' do
    context 'given  zero params' do
      it 'draw the current colony' do
        expect(GameOfLife.new.draw).to be_a(Array)
      end
    end
  end
end