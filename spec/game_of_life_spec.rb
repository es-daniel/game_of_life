require 'game_of_life'

describe GameOfLife do
  let(:game) { GameOfLife.new }

  describe '.initialize' do
    context 'given zero params' do
      it 'creates a new GameOfLife object' do
        expect(game).to be_a(GameOfLife)
      end

      it 'creates a new utils instance ' do
        expect(game.utils).to be_a(Utils)
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

  describe '.update_cell' do
    context 'given 4 arguments' do
      it "should accept cell's axis, the current cell and the total neighbors" do
        expect(game).to receive(:update_cell).with(an_instance_of(Integer),an_instance_of(Integer), an_instance_of(String),an_instance_of(Integer) )
        game.update_cell(0, 0, '▢', 0)
      end
    end
  end

  describe '.count_neighbors' do
    context 'given cell axis' do
      it 'should return an integer' do
        expect(game.count_neighbors(0, 0, game.grid[0])).to be_a(Integer)
      end

      it 'should return 0 at the begining' do
        expect(game.count_neighbors(0, 0, game.grid[0])).to eq(0)
      end

    end
  end

  describe '.start' do
    context 'given zero arguments' do
      it 'should run the game' do
        expect(game).to receive(:start)
        game.start
      end
    end
  end

end