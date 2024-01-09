require_relative '../../../automated_init'

context "Literal Pattern" do
  context "Singleton" do
    context "Source" do
      context "Printable Character" do
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

      context "Non-Printable Character" do
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
end
