require_relative '../automated_init'

context "Pattern" do
  context "Nothing" do
    pattern = Pattern::Nothing.build

    str = Controls::String.example

    effect = nil
    blk = proc {
      effect = :_
    }

    test! "Doesn't raise StopIteration" do
      refute_raises(StopIteration) do
        pattern.match(str, &blk)
      end
    end

    context "Block Argument" do
      executed = !effect.nil?

      test "Not executed" do
        refute(executed)
      end
    end
  end
end
