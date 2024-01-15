require_relative "../../automated_init"

context "Builder" do
  context "Start Alternative" do
    builder = Builder.new

    current_rule = Controls::Rule::New.example
    builder.current_rule = current_rule

    builder.start_alternative

    context "Current Alternative" do
      current_alternative = builder.current_alternative

      test "Set" do
        refute(current_alternative.nil?)
      end
    end

    context "Current Rule" do
      context "Alternatives" do
        alternatives = current_rule.alternatives

        added = alternatives.include?(builder.current_alternative)

        test "Added" do
          assert(added)
        end
      end
    end
  end
end
