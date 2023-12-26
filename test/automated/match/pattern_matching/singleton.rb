require_relative '../../automated_init'

context "Match" do
  context "Pattern Matching" do
    context "Singleton" do
      items = [
        Controls::Match::Singleton.example('a'),
        'b'
      ]

      match = Controls::Match.example(items:)

      case match
      in 'a', 'b'
        matched = true
      else
        matched = false
      end

      test "Matched" do
        assert(matched)
      end
    end
  end
end
