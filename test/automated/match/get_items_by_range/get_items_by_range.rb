require_relative '../../automated_init'

context "Match" do
  context "Get Segments By Range" do
    segments = ['a', 'b', 'c']

    match = Controls::Match.example(segments:)

    context "Specific Range" do
      range = 0..1

      context "Segments" do
        segments = match.segments_by_range(range)
        control_segments = ['a', 'b']

        comment segments.inspect
        detail "Control: #{control_segments.inspect}"

        test do
          assert(segments == control_segments)
        end
      end
    end

    context "Endless Range" do
      range = (1..)

      context "Segments" do
        segments = match.segments_by_range(range)
        control_segments = ['b', 'c']

        comment segments.inspect
        detail "Control: #{control_segments.inspect}"

        test do
          assert(segments == control_segments)
        end
      end
    end
  end
end
