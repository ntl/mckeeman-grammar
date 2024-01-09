require_relative '../../automated_init'

context "Singleton Pattern" do
  context "Source" do
    context "Codepoint Is Printable" do
      codepoint = "a".codepoints.first

      pattern = Pattern::Singleton.new(codepoint)

      source = pattern.source
      comment source

      control_source = "'#{codepoint.chr}'"
      detail "Control: #{control_source}"

      test do
        assert(source == control_source)
      end
    end

    context "Codepoint Isn't Printable" do
      codepoint = "\1".codepoints.first

      pattern = Pattern::Singleton.new(codepoint)

      source = pattern.source
      comment source

      control_source = "'0001'"
      detail "Control: #{control_source}"

      test do
        assert(source == control_source)
      end
    end
  end
end
