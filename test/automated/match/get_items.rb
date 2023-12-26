require_relative '../automated_init'

context "Match" do
  context "Get Items" do
    context "Range" do
      items = ['a', 'b', 'c']
      match = Controls::Match.example(items:)

      range = 0..1

      context "Items" do
        items = match.items_by_range(range)
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
        items = match.get_items(rule_name)

        comment items.inspect
        detail "Control: #{control_items.inspect}"

        test do
          assert(items == control_items)
        end
      end
    end
  end
end
