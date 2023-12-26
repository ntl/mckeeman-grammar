require_relative '../../automated_init'

context "Match" do
  context "Pattern Matching" do
    context "Match All Items" do
      match = Controls::Match.example

      case match
      in 'a', value, 'c'
        matched = value == 'b'
      else
        matched = false
      end

      test "Matched" do
        assert(matched)
      end
    end
  end
end
