require_relative "../../automated_init"

context "Builder" do
  context "Finish Rule" do
    builder = Builder.new

    rule = Controls::Rule.example
    builder.current_rule = rule

    builder.finish_rule

    context "Current Rule" do
      current_rule = builder.current_rule

      test "Reset" do
        assert(current_rule.nil?)
      end
    end
  end
end
