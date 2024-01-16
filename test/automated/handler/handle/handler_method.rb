require_relative "../../automated_init"

context "Handler" do
  context "Handle Match" do
    context "Handler Method" do
      match = Controls::Match.example

      context "Handler Doesn't Implement General Handler Method" do
        handler = Controls::Handler.example

        handler.handle(match)

        context "Handled" do
          handled = handler.handled?(match)

          test do
            assert(handled)
          end
        end
      end

      context "Handler Also Implements General Handler Method" do
        handler = Controls::Handler.example do
          attr_accessor :handled_some_rule
          attr_accessor :handled_match

          def handle_some_rule
            self.handled_some_rule = true
          end

          def handle_match(_match)
            self.handled_match = true
          end

          def both_handled?
            handled_some_rule && handled_match
          end
        end

        handler.handle(match)

        context "Both handler methods are invoked" do
          both_handled = handler.both_handled?

          test do
            assert(both_handled)
          end
        end
      end
    end
  end
end
