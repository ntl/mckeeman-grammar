require_relative '../automated_init'

context "Match" do
  context "Get Item By Rule" do
    context "An Item's Rule Name Corresponds" do
      match = Controls::Match.example

      control_item = Controls::Match::Nested.example
      rule_name = control_item.rule_name

      context "Item" do
        item = match.item_by_rule(rule_name)

        comment item.inspect
        detail "Control: #{control_item.inspect}"

        test do
          assert(item == control_item)
        end
      end
    end

    context "An Item's Rule Name Doesn't Correspond" do
      match = Controls::Match.example

      rule_name = Controls::Rule::Name.random

      context "Item" do
        item = match.item_by_rule(rule_name)

        comment item.inspect

        test "None" do
          assert(item.nil?)
        end
      end
    end

    context "Multiple Items' Rule Names Correspond" do
      rule_name = Controls::Rule::Name.random

      items = [
        Controls::Match.example(rule_name:, items: ['a']),
        Controls::Match.example(rule_name:, items: ['b']),
        'c'
      ]

      match = Controls::Match.example(items:)

      test "Is an error" do
        assert_raises(Match::MatchError) do
          match.item_by_rule(rule_name)
        end
      end
    end
  end
end
