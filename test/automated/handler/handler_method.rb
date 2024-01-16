require_relative "../automated_init"

context "Handler" do
  context "Handler Method" do
    handler = Controls::Handler.example

    context "Handler Implements Handler Method For Matched Rule" do
      rule_name = Controls::RuleName.example
      match = Controls::Match.example(rule_name:)

      handler_method = handler.handler_method(match)
      comment handler_method.inspect

      control_handler_method = :"handle_#{rule_name}"
      detail "Control: #{control_handler_method.inspect}"

      test do
        assert(handler_method == control_handler_method)
      end
    end

    context "Handler Doesn't Implement Handler Method For Matched Rule" do
      rule_name = Controls::RuleName.random

      match = Controls::Match.example(rule_name:)

      handler_method = handler.handler_method(match)

      test "No handler method" do
        assert(handler_method.nil?)
      end
    end

    context "No Rule Was Matched" do
      match = Controls::Match.example(rule_name: :none)

      handler_method = handler.handler_method(match)

      test "No handler method" do
        assert(handler_method.nil?)
      end
    end
  end
end
