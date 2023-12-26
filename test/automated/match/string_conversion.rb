require_relative '../automated_init'

context "Match" do
  context "String Conversion" do
    match = Controls::Match.example

    control_string = Controls::Match.string

    context "Explicit Conversion: String()" do
      string = String(match)

      comment string.inspect
      detail "Control: #{control_string.inspect}"

      test do
        assert(string == control_string)
      end
    end

    context "Implicit Conversion: String.try_convert" do
      string = String.try_convert(match)

      test "Nil" do
        assert(string.nil?)
      end
    end
  end
end
