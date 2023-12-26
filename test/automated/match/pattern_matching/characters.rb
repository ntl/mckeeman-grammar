require_relative '../../automated_init'

context "Match" do
  context "Pattern Matching" do
    context "Characters" do
      characters = 'some-text'

      items = [
        Controls::Match::Characters.example(characters),
        'b'
      ]

      match = Controls::Match.example(items:)

      case match
      in text, 'b'
        matched = text == characters
      else
        matched = false
      end

      test "Matched" do
        assert(matched)
      end
    end
  end
end
