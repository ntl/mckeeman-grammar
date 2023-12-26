require_relative '../automated_init'

context "Match" do
  context "Text Predicate" do
    match = Controls::Match.example

    context "Given Text Corresponds With Match's String Representation" do
      text = Controls::Match.string

      result = match.text?(text)

      comment result.inspect

      test "Affirmative" do
        assert(result)
      end
    end

    context "Given Text Doesn't Correspond With Match's String Representation" do
      text = Controls::Random.string

      result = match.text?(text)

      comment result.inspect

      test "Negative" do
        refute(result)
      end
    end
  end
end
