require_relative "../../automated_init"

context "Match" do
  context "Pattern Matching" do
    context "Match By Rule Name" do
      match = Controls::Match.example

      context "Matches" do
        case match
        in rule: :some_rule
          matched = true
        else
          matched = false
        end

        test do
          assert(matched)
        end
      end

      context "Doesn't Match" do
        case match
        in some_unknown_rule:
          matched = true
        else
          matched = false
        end

        test "Not matched" do
          refute(matched)
        end
      end
    end
  end
end
