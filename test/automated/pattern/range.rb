require_relative '../automated_init'

context "Range Pattern" do
  pattern = Controls::Pattern::Range.example
  comment "Pattern:", pattern.source, quote: true

  context "Text Matches" do
    [
      [Controls::Pattern::Range::Codepoint.member, "Range Includes String's First Character"],
      [Controls::Pattern::Range::Codepoint.range_begin, "Range's First Character Matches String's First Character"],
      [Controls::Pattern::Range::Codepoint.range_end, "Range's Final Character Matches String's First Character"]
    ].each do |(codepoint, context_title)|
      context "#{context_title}" do
        text = Controls::Text.example(prefix: codepoint.chr)
        comment text.inspect

        match = pattern.match(text)

        test! do
          refute(match.nil?)
        end

        context "Match" do
          context "Rule Name" do
            rule_name = match.rule_name

            test "Not set" do
              assert(rule_name.nil?)
            end
          end

          context "String" do
            string = match.string
            comment string.inspect

            control_string = codepoint.chr
            detail "Control: #{control_string.inspect}"

            test do
              assert(string == control_string)
            end
          end
        end
      end
    end
  end

  context "No Match" do
    [
      [Controls::Pattern::Range::Codepoint.range_begin - 1, "Range's First Character Exceeds String's First Character"],
      [Controls::Pattern::Range::Codepoint.range_end + 1, "Range's Final Character Precedes String's First Character"],
      [Controls::Pattern::Range::Codepoint.excluded_codepoint, "String's First Character Is Excluded"],
      [Controls::Pattern::Range::Codepoint.excluded_range_member, "An Excluded Range Includes String's First Character"],
      [Controls::Pattern::Range::Codepoint.excluded_range_begin, "An Excluded Range's First Character Exceeds String's First Character"],
      [Controls::Pattern::Range::Codepoint.excluded_range_end, "An Excluded Range's Final Character Precedes String's First Character"]
    ].each do |(codepoint, context_title)|
      context "#{context_title}" do
        text = Controls::Text.example(prefix: codepoint.chr)
        comment text.inspect

        match = pattern.match(text)

        test "No match" do
          assert(match.nil?)
        end
      end
    end
  end
end
