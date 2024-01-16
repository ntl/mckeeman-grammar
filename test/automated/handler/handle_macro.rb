require_relative "../automated_init"

context "Handler" do
  context "Handler Macro" do
    rule_name = Controls::RuleName.example

    handler = Controls::Handler.example do
      attr_accessor :handled
      alias :handled? :handled

      handle rule_name do
        self.handled = true
      end
    end

    handler_method = :"handle_#{rule_name}"

    test! "Defined" do
      assert(handler.respond_to?(handler_method))
    end

    context "Handled" do
      handler.public_send(handler_method)

      handled = handler.handled?

      test do
        assert(handled)
      end
    end
  end
end
