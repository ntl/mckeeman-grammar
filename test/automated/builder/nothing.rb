require_relative "../automated_init"

context "Builder" do
  context "Nothing" do
    builder = Builder.new

    current_rule = Controls::Rule::New.example
    builder.current_rule = current_rule

    builder.nothing

    context "Current Rule" do
      context "Last Alternative" do
        alternatives = current_rule.alternatives

        last_alternative = alternatives.last

        test! "Nothing" do
          assert(last_alternative.instance_of?(Pattern::Nothing))
        end
      end
    end
  end
end

