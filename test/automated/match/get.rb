require_relative '../automated_init'

context "Match" do
  context "Get" do
    match = Controls::Match.example

    context "One Segment" do
      context "Position" do
        position = 0

        context "Segment" do
          segment = match.segment(position)
          control_segment = 'a'

          comment segment.inspect
          detail "Control: #{control_segment.inspect}"

          test do
            assert(segment == control_segment)
          end
        end
      end

      context "Rule" do
        control_segment = Controls::Match::Nested.example
        rule_name = control_segment.rule_name

        context "Segment" do
          segment = match[rule_name]

          comment segment.inspect
          detail "Control: #{control_segment.inspect}"

          test do
            assert(segment == control_segment)
          end
        end
      end
    end

    context "Multiple Segments" do
      context "Range" do
        segments = ['a', 'b', 'c']
        match = Controls::Match.example(segments:)

        range = 0..1

        context "Segments" do
          segments = match[range]
          control_segments = ['a', 'b']

          comment segments.inspect
          detail "Control: #{control_segments.inspect}"

          test do
            assert(segments == control_segments)
          end
        end
      end

      context "Rule" do
        rule_name = Controls::Rule::Name.random

        control_segments = [
          Controls::Match.example(rule_name:, segments: ['b']),
          Controls::Match.example(rule_name:, segments: ['c'])
        ]

        segments = ['a', *control_segments, 'd']
        match = Controls::Match.example(segments:)

        context "Segments" do
          segments = match[rule_name]

          comment segments.inspect
          detail "Control: #{control_segments.inspect}"

          test do
            assert(segments == control_segments)
          end
        end
      end
    end
  end
end
