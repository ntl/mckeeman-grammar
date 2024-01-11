require_relative "../../automated_init"

context "Builder" do
  context "Finish Rule" do
    context "No Current Rule" do
      builder = Builder.new

      test "Is an error" do
        assert_raises(Builder::StateError) do
          builder.finish_rule
        end
      end
    end
  end
end
