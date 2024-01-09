require_relative '../automated_init'

context "Match" do
  context "String Predicate" do
    match = Controls::Match.example

    context "Given String Corresponds With Match's String" do
      string = Controls::Match.string

      result = match.string?(string)

      comment result.inspect

      test "Affirmative" do
        assert(result)
      end
    end

    context "Given String Doesn't Correspond With Match's String" do
      string = Controls::Random.string

      result = match.string?(string)

      comment result.inspect

      test "Negative" do
        refute(result)
      end
    end
  end
end
