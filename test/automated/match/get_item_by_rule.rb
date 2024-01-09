require_relative "../automated_init"

context "Match" do
  context "Get Segment By Rule" do
    context "A Segment's Rule Name Corresponds" do
      match = Controls::Match.example

      control_segment = Controls::Match::Nested.example
      rule_name = control_segment.rule_name

      context "Segment" do
        segment = match.segment_by_rule(rule_name)

        comment segment.inspect
        detail "Control: #{control_segment.inspect}"

        test do
          assert(segment == control_segment)
        end
      end
    end

    context "A Segment's Rule Name Doesn't Correspond" do
      match = Controls::Match.example

      rule_name = Controls::Rule::Name.random

      context "Segment" do
        segment = match.segment_by_rule(rule_name)

        comment segment.inspect

        test "None" do
          assert(segment.nil?)
        end
      end
    end

    context "Multiple Segments' Rule Names Correspond" do
      rule_name = Controls::Rule::Name.random

      segments = [
        Controls::Match.example(rule_name:, segments: ["a"]),
        Controls::Match.example(rule_name:, segments: ["b"]),
        "c"
      ]

      match = Controls::Match.example(segments:)

      test "Is an error" do
        assert_raises(Match::MatchError) do
          match.segment_by_rule(rule_name)
        end
      end
    end
  end
end
