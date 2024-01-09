require_relative '../automated_init'

context "Match" do
  context "Length" do
    context "Match Has Segments" do
      segments = ['1', '23', '456']
      control_length = 6

      match = Controls::Match.example(segments:)

      length = match.length

      comment length.inspect
      detail "Control: #{control_length.inspect}"

      test do
        assert(length == control_length)
      end
    end

    context "Match Doesn't Have Any Segments" do
      match = Controls::Match.example(segments: :none)

      length = match.length

      comment length.inspect

      test "Zero" do
        assert(length.zero?)
      end
    end
  end
end
