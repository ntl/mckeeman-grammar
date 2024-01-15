require_relative "../../automated_init"

context "Builder" do
  context "Finish Alternative" do
    builder = Builder.new

    alternative = Controls::Pattern::Alternative.example
    builder.current_alternative = alternative

    builder.finish_alternative

    context "Current Alternative" do
      current_alternative = builder.current_alternative

      test "Reset" do
        assert(current_alternative.nil?)
      end
    end
  end
end
