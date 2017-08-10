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

    it 'Returns true when a player wins horizontally' do
      subject.move(:X, 0)
      subject.move(:X, 1)
      subject.move(:X, 2)
      expect(subject.winner?(:X)).to be true
    end

    it 'Returns true when a player wins vertically' do
      subject.move(:X, 0)
      subject.move(:X, 3)
      subject.move(:X, 6)
      expect(subject.winner?(:X)).to be true
    end

    it 'Returns true when a player wins diagonally' do
      subject.move(:X, 0)
      subject.move(:X, 4)
      subject.move(:X, 8)
      expect(subject.winner?(:X)).to be true
    end

    it 'Returns false when nobody has won' do
      subject.move(:X, 0)
      subject.move(:O, 1)
      subject.move(:X, 2)
      expect(subject.winner?(:O)).to_not be true
    end
  end
end
