require_relative "../../automated_init"

context "Handler" do
  context "Handle Match" do
    context "No Handler Method" do
      match = Controls::Match.example

      context "Handler Doesn't Implement General Handler Method" do
        handler = Controls::Handler::None.new

        test "Isn't an error" do
          refute_raises do
            handler.handle(match)
          end
        end
      end

      context "Handler Implements General Handler Method" do
        handler = Controls::Handler::All.new

        handled = handler.handle(match)

        context "Handled" do
          handled = handler.handled?(match)

          test do
            assert(handled)
          end
        end
      end
    end
  end
end
