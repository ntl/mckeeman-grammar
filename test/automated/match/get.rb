require_relative '../automated_init'

context "Match" do
  context "Get" do
    match = Controls::Match.example

    context "One Item" do
      context "Position" do
        position = 0

        context "Item" do
          item = match.item(position)
          control_item = 'a'

          comment item.inspect
          detail "Control: #{control_item.inspect}"

          test do
            assert(item == control_item)
          end
        end
      end

      context "Rule" do
        control_item = Controls::Match::Nested.example
        rule_name = control_item.rule_name

        context "Item" do
          item = match[rule_name]

          comment item.inspect
          detail "Control: #{control_item.inspect}"

          test do
            assert(item == control_item)
          end
        end
      end
    end

    context "Multiple Items" do
      context "Range" do
        items = ['a', 'b', 'c']
        match = Controls::Match.example(items:)

        range = 0..1

        context "Items" do
          items = match[range]
          control_items = ['a', 'b']

          comment items.inspect
          detail "Control: #{control_items.inspect}"

          test do
            assert(items == control_items)
          end
        end
      end

      context "Rule" do
        rule_name = Controls::Rule::Name.random

        control_items = [
          Controls::Match.example(rule_name:, items: ['b']),
          Controls::Match.example(rule_name:, items: ['c'])
        ]

        items = ['a', *control_items, 'd']
        match = Controls::Match.example(items:)

        context "Items" do
          items = match[rule_name]

          comment items.inspect
          detail "Control: #{control_items.inspect}"

          test do
            assert(items == control_items)
          end
        end
      end
    end
  end
end
