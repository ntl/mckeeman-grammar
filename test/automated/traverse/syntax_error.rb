require_relative "../automated_init"

context "Traverse" do
  context "Syntax Error" do
    root_pattern = Controls::Rule::Root.example

    handler = Controls::Handler.example

    traverse = Traverse.new(root_pattern, handler)

    context "No Match" do
      text = "some-other-text-#{Controls::Text.example}"

      comment text.inspect

      test do
        assert_raises(Traverse::SyntaxError) do
          traverse.(text)
        end
      end
    end

    context "Partial Match" do
      text = "#{Controls::Text.example}-some-more-text"

      comment text.inspect

      test do
        assert_raises(Traverse::SyntaxError) do
          traverse.(text)
        end
      end
    end
  end
end
