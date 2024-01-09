require_relative "../../automated_init"

context "Singleton Pattern" do
  pattern = Controls::Pattern::Singleton.example
  comment "Pattern:", pattern.source, quote: true

  control_codepoint = Controls::Pattern::Singleton.codepoint

  context "Text Matches" do
    codepoint = control_codepoint

    text = Controls::Text.example(prefix: codepoint.chr)
    comment "Text: #{text.inspect}"

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

  context "Text Doesn't Match" do
    [
      [control_codepoint - 1, "Pattern's Codepoint Precedes String's First Character"],
      [control_codepoint + 1, "Pattern's Codepoint Exceeds String's First Character"]
    ].each do |(codepoint, context_title)|
      context "#{context_title}" do
        text = Controls::Text.example(prefix: codepoint.chr)
        comment "Text: #{text.inspect}"

        match = pattern.match(text)

        test "No match" do
          assert(match.nil?)
        end
      end
    end
  end
end
