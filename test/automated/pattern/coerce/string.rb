require_relative '../../automated_init'

context "Pattern" do
  context "Coerce" do
    context "String" do
      control_characters = Controls::Pattern::CharacterLiteral.characters

      string = control_characters
      pattern = Pattern(string)

      comment pattern.inspect

      test! "Character literal" do
        assert(pattern.instance_of?(Pattern::CharacterLiteral))
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

