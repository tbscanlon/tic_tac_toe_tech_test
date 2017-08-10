describe Board do
  describe 'Initialisation' do
    it 'Has a 3x3 board by default' do
      expect(subject.board.length).to eq 9
    end
  end

  describe '#move' do
    it { is_expected.to respond_to :move }

    it 'Updates the board with the player\'s move' do
      subject.move('X', 0)
      expect(subject.board[0]).to eq 'X'
    end

    context 'Invalid Moves' do
      it 'Does not allow moves outside the board' do
        expect { subject.move('X', 50) }.to raise_error 'Out of Bounds'
      end

      it 'Does not allow overlapping moves' do
        subject.move('X', 0)
        expect { subject.move('O', 0) }.to raise_error 'Invalid Move'
      end
    end
  end

  describe '#winner?' do
    it { is_expected.to respond_to :winner? }

    before(:each) do
      subject.move('X', 0)
      subject.move('X', 1)
      subject.move('X', 2)
    end

    it 'Returns true when a player wins horizontally' do
      expect(subject.winner? 'X').to be_truthy
    end
  end
end
