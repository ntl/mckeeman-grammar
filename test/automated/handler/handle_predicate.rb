require_relative "../automated_init"

context "Handler" do
  context "Handle Predicate" do
    match = Controls::Match.example

    context "Handles Match" do
      context "Handler Implements Handler Method For Matched Rule" do
        handler = Controls::Handler.example

        handles = handler.handle?(match)
        comment handles.inspect

        test do
          assert(handles)
        end
      end

      context "Handler Implements General Handler Method" do
        handler = Controls::Handler::All.new

        handles = handler.handle?(match)
        comment handles.inspect

        test do
          assert(handles)
        end
      end
    end

    context "Doesn't Handle Match" do
      handler = Controls::Handler::None.new

      handles = handler.handle?(match)
      comment handles.inspect

      test do
        refute(handles)
      end
    end
  end
end
