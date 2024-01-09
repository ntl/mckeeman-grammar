require_relative '../../automated_init'

context "Match" do
  context "Get Segment By Position" do
    context "Nested Match" do
      nested_match = Controls::Match.example
      segments = [nested_match]

      match = Controls::Match.example(segments:)

      position = 0

      context "Segment" do
        segment = match.segment_by_position(position)

        comment segment.inspect
        detail "Control: #{nested_match.inspect}"

        test do
          assert(segment == nested_match)
        end
      end
    end
  end
end
