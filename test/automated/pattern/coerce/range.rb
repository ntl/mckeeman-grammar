require_relative '../../automated_init'

context "Pattern" do
  context "Coerce" do
    context "Range" do
      control_range = Controls::Pattern::Range.range

      range = control_range
      pattern = Pattern(range)

      comment pattern.inspect

      test! "Range pattern" do
        assert(pattern.instance_of?(Pattern::Range))
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

        test "None" do
          assert(exclusions.none?)
        end
      end
    end
  end
end
