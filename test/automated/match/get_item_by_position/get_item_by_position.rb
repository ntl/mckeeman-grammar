require_relative '../../automated_init'

context "Match" do
  context "Get Segment By Position" do
    segments = ['a', 'b', 'c']

    match = Controls::Match.example(segments:)

    context "Positive Index" do
      context "Within Bounds" do
        position = 1

        context "Segment" do
          segment = match.segment_by_position(position)
          control_segment = 'b'

          comment segment.inspect
          detail "Control: #{control_segment.inspect}"

          test do
            assert(segment == control_segment)
          end
        end
      end

      context "Out of Bounds" do
        position = 3

        context "Segment" do
          segment = match.segment_by_position(position)

          comment segment.inspect

          test "None" do
            assert(segment.nil?)
          end
        end
      end
    end

    context "Negative Index" do
      context "Within Bounds" do
        position = -1

        context "Segment" do
          segment = match.segment_by_position(position)
          control_segment = 'c'

          comment segment.inspect
          detail "Control: #{control_segment.inspect}"

          test do
            assert(segment == control_segment)
          end
        end
      end

      context "Out of Bounds" do
        position = -4

        context "Segment" do
          segment = match.segment_by_position(position)

          comment segment.inspect

          test "None" do
            assert(segment.nil?)
          end
        end
      end
    end
  end
end
