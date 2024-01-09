require_relative '../../automated_init'

context "Literal Pattern" do
  context "Character Literal" do
    str = Controls::String.example

    comment "String: #{str.inspect}"

    context "Match" do
      characters = str.split("-").first

      pattern = Pattern::CharacterLiteral.new(characters)
      comment "Pattern: #{pattern.source}"

      match = :_
      blk = proc { |_match|
        match = _match
      }

      test! "Doesn't signal StopIteration" do
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

        context "Items" do
          items = match.items
          comment items.inspect

          control_items = [characters]
          detail "Control: #{control_items.inspect}"

          test do
            assert(items == control_items)
          end
        end
      end
    end

    context "No Match" do
      characters = str.split("-").last

      pattern = Pattern::CharacterLiteral.new(characters)
      comment "Pattern: #{pattern.source}"

      effect = nil
      blk = proc {
        effect = :_
      }

      test! "Signal StopIteration" do
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
