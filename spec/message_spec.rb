require 'rspec'
require 'message'

describe '#Message' do
  before(:each) do
     Message.clear()
   end
  describe '.all' do
    it "returns a list of all messges" do
      message1 = Message.new("hello", "ben", 1)
      message1.save()
      message2 = Message.new("goodbye", "ben", 1)
      message2.save()
      expect(Message.all).to eq([message1, message2])
    end
  end
  describe '.clear' do
    it "clears all messages" do
      message1 = Message.new("hello", "ben", 1)
      message1.save()
      message2 = Message.new("goodbye", "ben", 1)
      message2.save()
      Message.clear()
      expect(Message.all).to eq([])
    end
  end
  describe '.find' do
    it "finds a message by id" do
      message1 = Message.new("hello", "ben", 1)
      message1.save()
      message2 = Message.new("goodbye", "ben", 1)
      message2.save()
      expect(Message.find(message1.id)).to eq(message1)
      expect(Message.find(message2.id)).to eq(message2)
    end
  end
  describe '.find_by_board' do
    it "finds songs for a board" do
      message1 = Message.new("hello", "ben", 1)
      message1.save()
      message2 = Message.new("goodbye", "ben", 1)
      message2.save()
      message3 = Message.new("what's up?", "josh", 2)
      message3.save()
      expect(Message.find_by_board(1)).to eq([message1, message2])
      expect(Message.find_by_board(2)).to eq([message3])
    end
  end
  describe '#save' do
    it "saves a message" do
      message1 = Message.new("hello", "ben", 1)
      message1.save()
      message2 = Message.new("goodbye", "ben", 1)
      message2.save()
      message3 = Message.new("what's up?", "josh", 2)
      message3.save()
      expect(Message.all).to eq([message1, message2, message3])
    end
  end
  describe '#==' do
    it "is the same message if it has the same attributes as another message" do
      message1 = Message.new("hello", "ben", 1)
      message2 = Message.new("hello", "ben", 1, 1)
      expect(message1 == message2).to eq(true)
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
end
