require_relative "../automated_init"

context "Builder" do
  context "Current Rule Predicate" do
    context "Current Rule" do
      builder = Builder.new

      rule = Controls::Rule.example
      builder.current_rule = rule

      current_rule = builder.current_rule?

      comment current_rule.inspect

      test do
        assert(current_rule)
      end
    end

    context "No Current Rule" do
      builder = Builder.new

      current_rule = builder.current_rule?

      comment current_rule.inspect

      test do
        refute(current_rule)
      end
    end
  end
end
