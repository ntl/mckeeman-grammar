require_relative "../../automated_init"

context "Builder" do
  context "Finish Alternative" do
    context "No Current Alternative" do
      builder = Builder.new

      test "Is an error" do
        assert_raises(Builder::StateError) do
          builder.finish_alternative
        end
      end
    end
  end
end
