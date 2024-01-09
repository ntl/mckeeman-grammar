require_relative '../automated_init'

context "Pattern" do
  context "Alternative" do
    pattern = Controls::Pattern::Alternative.example
    comment "Pattern:", pattern.source, quote: true

    context "Text Matches" do
      control_string = Controls::Text.example

      text = "#{control_string}-some-more-text"
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

          detail "Control: #{control_string.inspect}"

          test do
            assert(string == control_string)
          end
        end
      end
    end

    context "Text Doesn't Match" do
      text = Controls::Text.other_example
      comment text.inspect

      match = pattern.match(text)

      test "No match" do
        assert(match.nil?)
      end
    end
  end
end
