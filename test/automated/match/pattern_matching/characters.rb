require_relative "../../automated_init"

context "Match" do
  context "Pattern Matching" do
    context "Characters" do
      characters = "some-text"

      segments = [
        Controls::Match::Characters.example(characters),
        "b"
      ]

      match = Controls::Match.example(segments:)

      case match
      in string, "b"
        matched = string == characters
      else
        matched = false
      end

      test "Matched" do
        assert(matched)
      end
    end
  end
end
