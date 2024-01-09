require_relative '../../automated_init'

context "Match" do
  context "Get Segments By Range" do
    context "Nested Match" do
      segments = ['a', Controls::Match::Nested.example, 'b']
      match = Controls::Match.example(segments:)

      range = (1..)

      control_segments = segments[range]

      context "Segments" do
        segments = match.segments_by_range(range)

        comment segments.inspect
        detail "Control: #{control_segments.inspect}"

        test do
          assert(segments == control_segments)
        end
      end
    end
  end
end
