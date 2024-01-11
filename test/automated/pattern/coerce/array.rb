require_relative '../../automated_init'

context "Pattern" do
  context "Coerce" do
    context "Array" do
      segments = Controls::Pattern::Alternative.segments

      array = segments
      pattern = Pattern(array)

      comment pattern.inspect

      test! "Alternative" do
        assert(pattern.instance_of?(Pattern::Alternative))
      end

      _context "Segment Patterns" do
        segment_patterns = pattern.segment_patterns
        comment segment_patterns.pretty_inspect

        control_segment_patterns = Controls::Pattern::Alternative.segment_patterns
        detail "Control:", control_segment_patterns.pretty_inspect

        test do
          assert(segment_patterns == control_segment_patterns)
        end
      end
    end
  end
end
