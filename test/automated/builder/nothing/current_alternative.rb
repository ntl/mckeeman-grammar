require_relative "../../automated_init"

context "Builder" do
  context "Nothing" do
    context "Current Alternative" do
      builder = Controls::Builder::Alternative.example

      test "Is an error" do
        assert_raises(Builder::StateError) do
          builder.nothing
        end
      end
    end
  end
end
