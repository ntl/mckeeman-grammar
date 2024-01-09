require_relative '../automated_init'

context "Pattern" do
  context "Nothing" do
    pattern = Pattern::Nothing.build

    comment "Pattern: #{pattern.source}"

    str = Controls::String.example

    effect = nil
    blk = proc {
      effect = :_
    }

    test! "Doesn't signal StopIteration" do
      refute_raises(StopIteration) do
        pattern.match(str, &blk)
      end
    end

    context "No match" do
      match = !effect.nil?

      test do
        refute(match)
      end
    end
  end
end
