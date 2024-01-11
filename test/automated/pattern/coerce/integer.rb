require_relative '../../automated_init'

context "Pattern" do
  context "Coerce" do
    context "Integer" do
      control_codepoint = Controls::Pattern::Singleton.codepoint

      integer = control_codepoint
      pattern = Pattern(integer)

      comment pattern.inspect

      test! "Singleton" do
        assert(pattern.instance_of?(Pattern::Singleton))
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
