require_relative "../automated_init"

context "Match" do
  context "Get Segments" do
    context "Range" do
      segments = ["a", "b", "c"]
      match = Controls::Match.example(segments:)

      range = 0..1

      context "Segments" do
        segments = match.segments_by_range(range)
        control_segments = ["a", "b"]

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
        Controls::Match.example(rule_name:, segments: ["b"]),
        Controls::Match.example(rule_name:, segments: ["c"])
      ]

      segments = ["a", *control_segments, "d"]
      match = Controls::Match.example(segments:)

      context "Segments" do
        segments = match.get_segments(rule_name)

        comment segments.inspect
        detail "Control: #{control_segments.inspect}"

        test do
          assert(segments == control_segments)
        end
      end
    end
  end
end
