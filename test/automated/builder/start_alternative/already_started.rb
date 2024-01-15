require_relative "../../automated_init"

context "Builder" do
  context "Start Alternative" do
    context "Alternative Is Already Started" do
      builder = Builder.new

      alternative = Controls::Pattern::Alternative.example
      builder.current_alternative = alternative

      test "Is an error" do
        assert_raises(Builder::StateError) do
          builder.start_alternative
        end
      end
    end
  end
end
