require_relative "../../automated_init"

context "Builder" do
  context "Range" do
    context "No Current Alternative" do
      builder = Controls::Builder::New.example

      range = Controls::Pattern::Range.range

      test "Is an error" do
        assert_raises(Builder::StateError) do
          builder.range(range)
        end
      end
    end
  end
end
