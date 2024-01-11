require_relative '../../automated_init'

context "Pattern" do
  context "Coerce" do
    context "Nil" do
      pattern = Pattern(nil)

      comment pattern.inspect

      test "Nothing" do
        assert(pattern.instance_of?(Pattern::Nothing))
      end
    end
  end
end
