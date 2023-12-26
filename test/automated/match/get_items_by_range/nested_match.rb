require_relative '../../automated_init'

context "Match" do
  context "Get Items By Range" do
    context "Nested Match" do
      items = ['a', Controls::Match::Nested.example, 'b']
      match = Controls::Match.example(items:)

      range = (1..)

      control_items = items[range]

      context "Items" do
        items = match.items_by_range(range)

        comment items.inspect
        detail "Control: #{control_items.inspect}"

        test do
          assert(items == control_items)
        end
      end
    end
  end
end
