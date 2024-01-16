require_relative "../../automated_init"

context "Handler" do
  context "Handle Match" do
    context "Handler Method Doesn't Accept An Argument" do
      match = Controls::Match.example

      handler = Controls::Handler.example do
        attr_accessor :handled
        alias :handled? :handled

        def handle_some_rule
          self.handled = true
        end
      end

      test! "Isn't an error" do
        refute_raises(ArgumentError) do
          handler.handle(match)
        end
      end

      context "Handled" do
        handled = handler.handled?

        test do
          assert(handled)
        end
      end
    end
  end
end
