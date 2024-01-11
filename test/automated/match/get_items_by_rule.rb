require_relative "../automated_init"

context "Match" do
  context "Get Segments By Rule" do
    context "A Segment's Rule Name Corresponds" do
      match = Controls::Match.example

      control_segment = Controls::Match::Nested.example
      control_segments = [control_segment]

      rule_name = control_segment.rule_name

      context "Segments" do
        segments = match.segments_by_rule(rule_name)

        comment segments.inspect
        detail "Control: #{control_segments.inspect}"

        test do
          assert(segments == control_segments)
        end
      end
    end

    context "A Segment's Rule Name Doesn't Correspond" do
      match = Controls::Match.example

      rule_name = Controls::RuleName.random

      context "Segments" do
        segments = match.segments_by_rule(rule_name)

        comment segments.inspect

        test "None" do
          assert(segments.empty?)
        end
      end
    end

    context "Multiple Segments' Rule Names Correspond" do
      rule_name = Controls::RuleName.random

      control_segments = [
        Controls::Match.example(rule_name:, segments: ["b"]),
        Controls::Match.example(rule_name:, segments: ["c"])
      ]

      segments = ["a", *control_segments, "d"]
      match = Controls::Match.example(segments:)

      context "Segments" do
        segments = match.segments_by_rule(rule_name)

        comment segments.inspect
        detail "Control: #{control_segments.inspect}"

        test do
          assert(segments == control_segments)
        end
      end
    end
  end
end
