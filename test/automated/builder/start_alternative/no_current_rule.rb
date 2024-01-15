require_relative "../../automated_init"

context "Builder" do
  context "Start Alternative" do
    context "No Current Rule" do
      builder = Builder.new

      test "Is an error" do
        assert_raises(Builder::StateError) do
          builder.start_alternative
        end
      end
    end
  end
end
