require_relative "../../automated_init"

context "Builder" do
  context "Singleton" do
    context "No Current Alternative" do
      builder = Controls::Builder::New.example

      control_codepoint = Controls::Codepoint.example

      test "Is an error" do
        assert_raises(Builder::StateError) do
          builder.singleton(control_codepoint)
        end
      end
    end
  end
end
