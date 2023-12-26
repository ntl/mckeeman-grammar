require_relative '../../automated_init'

context "Match" do
  context "Get Item By Position" do
    context "Nested Match" do
      nested_match = Controls::Match.example
      items = [nested_match]

      match = Controls::Match.example(items:)

      position = 0

      context "Item" do
        item = match.item_by_position(position)

        comment item.inspect
        detail "Control: #{nested_match.inspect}"

        test do
          assert(item == nested_match)
        end
      end
    end
  end
end
