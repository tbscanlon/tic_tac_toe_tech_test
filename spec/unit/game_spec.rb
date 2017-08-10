describe Game do
  let(:p1) { double('X') }
  let(:p2) { double('O') }
  let(:game) { described_class.new(p1, p2) }

  describe 'Initialisation' do
    it 'Has player X' do
      expect(game.player1).to eq p1
    end

    it 'Has player O' do
      expect(game.player2).to eq p2
    end
  end
end
