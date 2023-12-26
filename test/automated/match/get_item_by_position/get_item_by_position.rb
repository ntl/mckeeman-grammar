require_relative '../../automated_init'

context "Match" do
  context "Get Item By Position" do
    items = ['a', 'b', 'c']

    match = Controls::Match.example(items:)

    context "Positive Index" do
      context "Within Bounds" do
        position = 1

        context "Item" do
          item = match.item_by_position(position)
          control_item = 'b'

          comment item.inspect
          detail "Control: #{control_item.inspect}"

          test do
            assert(item == control_item)
          end
        end
      end

      context "Out of Bounds" do
        position = 3

        context "Item" do
          item = match.item_by_position(position)

          comment item.inspect

          test "None" do
            assert(item.nil?)
          end
        end
      end
    end

    context "Negative Index" do
      context "Within Bounds" do
        position = -1

        context "Item" do
          item = match.item_by_position(position)
          control_item = 'c'

          comment item.inspect
          detail "Control: #{control_item.inspect}"

          test do
            assert(item == control_item)
          end
        end
      end

      context "Out of Bounds" do
        position = -4

        context "Item" do
          item = match.item_by_position(position)

          comment item.inspect

          test "None" do
            assert(item.nil?)
          end
        end
      end
    end
  end
end
