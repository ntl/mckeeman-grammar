require_relative '../../automated_init'

context "Match" do
  context "Get Items By Range" do
    items = ['a', 'b', 'c']

    match = Controls::Match.example(items:)

    context "Specific Range" do
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

    context "Endless Range" do
      range = (1..)

      context "Items" do
        items = match.items_by_range(range)
        control_items = ['b', 'c']

        comment items.inspect
        detail "Control: #{control_items.inspect}"

        test do
          assert(items == control_items)
        end
      end
    end
  end
end
