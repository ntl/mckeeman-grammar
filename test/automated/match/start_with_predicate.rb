require_relative "../automated_init"

context "Match" do
  context "Start With Predicate" do
    match = Controls::Match.example

    context "Match's String Representation Starts With Given String" do
      string = Controls::Match.string[0]

      result = match.start_with?(string)

      comment result.inspect

      test "Affirmative" do
        assert(result)
      end
    end

    context "Match's String Representation Doesn't Start With Given String" do
      string = Controls::Match.string[1]

      result = match.start_with?(string)

      comment result.inspect

      test "Negative" do
        refute(result)
      end
    end
  end
end
