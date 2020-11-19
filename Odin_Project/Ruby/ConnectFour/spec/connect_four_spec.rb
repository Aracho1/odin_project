require 'connect_four'

Describe Board do
  board = Board.new
    describe '#print_board' do
      it "prints out 3 x 3 board" do
        expect(board.print_board).to eql(
        --- --- ---
        |   |   |   |
         --- --- ---
        |   |   |   |
         --- --- ---
        |   |   |   |
         --- --- --- )
    end
  end
end
