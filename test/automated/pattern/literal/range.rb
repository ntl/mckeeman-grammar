require_relative '../../automated_init'

context "Literal Pattern" do
  context "Range" do
    pattern = Controls::Pattern::Range.example
    comment "Pattern: #{pattern.source}"

    context "Match" do
      [
        [Controls::Pattern::Range::Codepoint.range_begin, "String's First Character Matches Range's Beginning Codepoint"],
        [Controls::Pattern::Range::Codepoint.range_end, "String's First Character Matches Range's Ending Codepoint"],
        [Controls::Pattern::Range::Codepoint.member, "String's First Codepoint Is Between Range's Begin and End"]
      ].each do |(codepoint, context_title)|
        context "#{context_title}" do
          str = "#{codepoint.chr}-some-string"
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

            context "Items" do
              items = match.items
              comment items.inspect

              control_items = [codepoint.chr]
              detail "Control: #{control_items.inspect}"

              test do
                assert(items == control_items)
              end
            end
          end
        end
      end
    end

    context "No Match" do
      [
        [Controls::Pattern::Range::Codepoint.range_begin - 1, "String's First Codepoint Precedes Range's Beginning Codepoint"],
        [Controls::Pattern::Range::Codepoint.range_end + 1, "String's First Codepoint Exceeds Range's Ending Codepoint"],
        [Controls::Pattern::Range::Codepoint.excluded_codepoint, "String's First Codepoint Is An Excluded Codepoint"],
        [Controls::Pattern::Range::Codepoint.excluded_range_member, "String's First Codepoint Is Between An Excluded Range's Begin And End"],
        [Controls::Pattern::Range::Codepoint.excluded_range_begin, "String's First Character Matches An Excluded Range's Begin"],
        [Controls::Pattern::Range::Codepoint.excluded_range_end, "String's First Character Matches An Excluded Range's End"]
      ].each do |(codepoint, context_title)|
        context "#{context_title}" do
          str = "#{codepoint.chr}-some-string"
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
  end
end
