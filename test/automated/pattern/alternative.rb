require_relative '../automated_init'

context "Pattern" do
  context "Alternative" do
    pattern = Controls::Pattern::Alternative.example
    comment "Pattern: #{pattern.source}"

    context "String Matches" do
      control_text = Controls::Pattern::Alternative::String::Match.example

      str = Controls::String.example(prefix: control_text)
      comment str.inspect

      match = :_
      blk = proc { |_match|
        match = _match
      }

      test "Doesn't signal StopIteration" do
        refute_raises(StopIteration) do
          pattern.match(str, &blk)
        end
      end

      context "Match" do
        test! do
          refute(match.nil?)
        end

        context "Rule Name" do
          rule_name = match.rule_name

          test "Not set" do
            assert(rule_name.nil?)
          end
        end

        context "Text" do
          text = match.text
          comment text.inspect

          detail "Control: #{control_text.inspect}"

          test do
            assert(text == control_text)
          end
        end
      end
    end

    _context "String Doesn't Match" do
      str = Controls::Pattern::Alternative::String::NoMatch.example
      comment str.inspect

      effect = nil
      blk = proc {
        effect = :_
      }

      test "Signals StopIteration" do
        assert_raises(StopIteration) do
          pattern.match(str, &blk)
        end
      end

      context "No match" do
        match = !effect.nil?

        test do
          refute(match)
        end
      end
    end
  end
end
