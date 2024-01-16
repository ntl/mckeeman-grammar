require_relative "../../automated_init"

context "Builder" do
  context "Character Literal" do
    builder = Controls::Builder::Alternative.example

    control_characters = Controls::Text.example
    builder.character_literal(control_characters)

    context "Current Alternative" do
      alternative = builder.current_alternative

      context "Item Patterns" do
        item_patterns = alternative.item_patterns

	pattern = item_patterns.last

	test! "Added" do
	  refute(pattern.nil?)
	end

	context "Characters" do
	  characters = pattern.characters
	  comment characters.inspect

	  detail "Control: #{control_characters.inspect}"

	  test do
	    assert(characters == control_characters)
	  end
	end
      end
    end
  end
end
