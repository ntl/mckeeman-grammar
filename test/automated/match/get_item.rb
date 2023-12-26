require_relative '../automated_init'

context "Match" do
  context "Get Item" do
    match = Controls::Match.example

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
        item = match.item(rule_name)

        comment item.inspect
        detail "Control: #{control_item.inspect}"

        test do
          assert(item == control_item)
        end
      end
    end
  end
end
