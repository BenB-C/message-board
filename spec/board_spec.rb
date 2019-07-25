require 'rspec'
require 'board'

describe '#Board' do
  before(:each) do
    Board.clear()
  end
  describe '.all' do
    it("returns empty array because nothing has been saved") do
      expect(Board.all).to(eq([]))
    end
  end
  describe '#save' do
    it('saves the board') do
      board = Board.new("addBen")
      board.save()
      expect(Board.all).to(eq([board]))
    end
  end
  describe '#==' do
    it "is the same board if it has the same attributes as the other board" do
      board1 = Board.new('programming')
      board2 = Board.new('programming')
      expect(board1 == board2).to eq(true)
    end
    it "is the not same board if it doesn't have the same attributes as the other board" do
      board1 = Board.new('piracy')
      board2 = Board.new('programming')
      expect(board1 == board2).to eq(false)
    end
  end
  describe '.clear' do
    it "clears all boards" do
      board1 = Board.new('piracy')
      board2 = Board.new('programming')
      board1.save()
      board2.save()
      Board.clear()
      expect(Board.all).to eq([])
    end
  end
  describe '.find' do
    it "finds a board by id" do
      board1 = Board.new('piracy')
      board2 = Board.new('programming')
      board1.save()
      board2.save()
      expect(Board.find(board1.id)).to eq(board1)
      expect(Board.find(board2.id)).to eq(board2)
    end
  end
  # describe '' do
  #   it "" do
  #
  #   end
  # end
  # describe '' do
  #   it "" do
  #
  #   end
  # end

end # end of tests
