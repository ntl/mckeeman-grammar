require_relative "../../automated_init"

context "Builder" do
  context "Singleton" do
    builder = Controls::Builder::Alternative.example

    control_codepoint = Controls::Codepoint.example
    builder.singleton(control_codepoint)

    context "Current Alternative" do
      alternative = builder.current_alternative

      context "Item Patterns" do
        item_patterns = alternative.item_patterns

	pattern = item_patterns.last

	test! "Added" do
	  refute(pattern.nil?)
	end

	context "Codepoint" do
	  codepoint = pattern.codepoint
	  comment codepoint.inspect

	  detail "Control: #{control_codepoint.inspect}"

	  test do
	    assert(codepoint == control_codepoint)
	  end
	end
      end
    end
  end
end
