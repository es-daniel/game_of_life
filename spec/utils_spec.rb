require 'utils'

describe Utils do
  let(:utils) { Utils.new }
  let(:grid) {[%w[▢ ▢ ▢ ▢ ▢ ▢ ▢ ▢ ▢],%w[▢ ▣ ▣ ▣ ▢ ▢ ▢ ▢ ▢],%w[▢ ▢ ▣ ▢ ▢ ▢ ▢ ▢ ▢]]}

  describe '.initialize' do
    it 'creates a new Utils object' do
      expect(utils).to be_a(Utils)
    end
  end

  describe '.seed' do
    context 'given  a grid as a param' do
      it 'should accept an Array argument' do
        expect(utils).to receive(:seed).with(an_instance_of(Array))
        utils.seed(grid)
      end

      it 'should return an array' do
        expect(utils.seed(grid)).to be_a(Array)
      end
    end
  end

  describe '.rand_living_cell' do
    context 'given an array of cells' do
      it 'should accept an Array argument' do
        expect(utils).to receive(:rand_living_cell).with(an_instance_of(Array))
        utils.rand_living_cell(%w[▢ ▢ ▢ ▢ ▢ ▢ ▢ ▢ ▢])
      end

      it 'should return an string' do
        expect(utils.rand_living_cell(%w[▢ ▢ ▢ ▢ ▢ ▢ ▢ ▢ ▢])).to be_a(String)
      end
    end
  end

  describe '.draw' do
    context 'given  a grid as a param' do
      it 'should accept an Array argument' do
        expect(utils).to receive(:draw).with(an_instance_of(Array))
        utils.draw(grid)
      end
    end
  end

  describe '.build_new_grid' do
    context 'given zero params' do
      it 'should return a new array' do
        expect(utils.build_new_grid).to be_a(Array)
      end

      it 'should return a new 2-dimensional grid' do
        expect(utils.build_new_grid).to eq(Array.new(20) { Array.new(25) { '▢' } })
      end

    end
  end


end