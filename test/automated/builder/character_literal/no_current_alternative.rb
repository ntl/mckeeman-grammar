require_relative "../../automated_init"

context "Builder" do
  context "Character Literal" do
    context "No Current Alternative" do
      builder = Controls::Builder::New.example

      character_literal = Controls::Text.example

      test "Is an error" do
        assert_raises(Builder::StateError) do
          builder.character_literal(character_literal)
        end
      end
    end
  end
end
