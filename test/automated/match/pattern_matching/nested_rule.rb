require_relative '../../automated_init'

context "Match" do
  context "Pattern Matching" do
    context "Nested Rule" do
      context "Match By Rule Name" do
        match = Controls::Match.example

        case match
        in some_nested_rule: value
          matched = value == 'b'
        else
          matched = false
        end

        test "Matched" do
          assert(matched)
        end
      end

      context "Match By Text" do
        match = Controls::Match.example

        case match
        in 'a', text, 'c'
          matched = text == 'b'
        else
          matched = false
        end

        test "Matched" do
          assert(matched)
        end
      end

      context "Multiple Items Match" do
        items = [
          Controls::Match::Singleton.example('a'),
          Controls::Match::Singleton.example('b')
        ]

        match = Controls::Match.example(items:)

        test "Is an error" do
          assert_raises(Match::MatchError) do
            case match
            in some_singleton_rule: String
            else
            end
          end
        end
      end
    end
  end
end
