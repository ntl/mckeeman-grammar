require_relative "../automated_init"

context "Match" do
  context "End With Predicate" do
    match = Controls::Match.example

    context "Match's String Representation Ends With Given String" do
      text = Controls::Match.string[-1]

      result = match.end_with?(text)

      comment result.inspect

      test "Affirmative" do
        assert(result)
      end
    end

    context "Match's String Representation Doesn't End With Given String" do
      text = Controls::Match.string[-2]

      result = match.end_with?(text)

      comment result.inspect

      test "Negative" do
        refute(result)
      end
    end
  end
end
