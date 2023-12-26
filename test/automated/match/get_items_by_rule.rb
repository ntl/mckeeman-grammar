require_relative '../automated_init'

context "Match" do
  context "Get Items By Rule" do
    context "An Item's Rule Name Corresponds" do
      match = Controls::Match.example

      control_item = Controls::Match::Nested.example
      control_items = [control_item]

      rule_name = control_item.rule_name

      context "Items" do
        items = match.items_by_rule(rule_name)

        comment items.inspect
        detail "Control: #{control_items.inspect}"

        test do
          assert(items == control_items)
        end
      end
    end

    context "An Item's Rule Name Doesn't Correspond" do
      match = Controls::Match.example

      rule_name = Controls::Rule::Name.random

      context "Items" do
        items = match.items_by_rule(rule_name)

        comment items.inspect

        test "None" do
          assert(items.empty?)
        end
      end
    end

    context "Multiple Items' Rule Names Correspond" do
      rule_name = Controls::Rule::Name.random

      control_items = [
        Controls::Match.example(rule_name:, items: ['b']),
        Controls::Match.example(rule_name:, items: ['c'])
      ]

      items = ['a', *control_items, 'd']
      match = Controls::Match.example(items:)

      context "Items" do
        items = match.items_by_rule(rule_name)

        comment items.inspect
        detail "Control: #{control_items.inspect}"

        test do
          assert(items == control_items)
        end
      end
    end
  end
end
