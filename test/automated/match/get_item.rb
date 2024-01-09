require_relative "../automated_init"

context "Match" do
  context "Get Segment" do
    match = Controls::Match.example

    context "Position" do
      position = 0

      context "Segment" do
        segment = match.segment(position)
        control_segment = "a"

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
        segment = match.segment(rule_name)

        comment segment.inspect
        detail "Control: #{control_segment.inspect}"

        test do
          assert(segment == control_segment)
        end
      end
    end
  end
end
