require_relative '../automated_init'

context "Match" do
  context "Length" do
    context "Match Has Items" do
      items = ['1', '23', '456']
      control_length = 6

      match = Controls::Match.example(items:)

      length = match.length

      comment length.inspect
      detail "Control: #{control_length.inspect}"

      test do
        assert(length == control_length)
      end
    end

    context "Match Doesn't Have Any Items" do
      match = Controls::Match.example(items: :none)

      length = match.length

      comment length.inspect

      test "None" do
        assert(length.nil?)
      end
    end
  end
end
