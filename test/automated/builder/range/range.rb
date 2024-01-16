require_relative "../../automated_init"

context "Builder" do
  context "Range" do
    builder = Controls::Builder::Alternative.example

    control_range = Controls::Pattern::Range.range
    control_exclusions = Controls::Pattern::Range.exclusions

    builder.range(control_range, *control_exclusions)

    context "Current Alternative" do
      alternative = builder.current_alternative

      context "Item Patterns" do
        item_patterns = alternative.item_patterns

	pattern = item_patterns.last

	test! "Added" do
	  refute(pattern.nil?)
	end

        context "Range" do
          range = pattern.range
          comment range.inspect

          detail "Control: #{control_range.inspect}"

          test do
            assert(range == control_range)
          end
        end

        context "Exclusions" do
          exclusions = pattern.exclusions
          comment exclusions.inspect

          detail "Control: #{control_exclusions.inspect}"

          test do
            assert(exclusions == control_exclusions)
          end
        end
      end
    end
  end
end
