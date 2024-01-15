require_relative "../automated_init"

context "Builder" do
  context "Current Alternative Predicate" do
    context "Current Alternative" do
      builder = Builder.new

      alternative = Controls::Pattern::Alternative.example
      builder.current_alternative = alternative

      current_alternative = builder.current_alternative?

      comment current_alternative.inspect

      test do
        assert(current_alternative)
      end
    end

    context "No Current Alternative" do
      builder = Builder.new

      current_alternative = builder.current_alternative?

      comment current_alternative.inspect

      test do
        refute(current_alternative)
      end
    end
  end
end
