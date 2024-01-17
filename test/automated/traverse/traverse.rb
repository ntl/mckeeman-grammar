require_relative "../automated_init"

context "Traverse" do
  root_pattern = Controls::Rule::Root.example

  handler = Controls::Handler.example do
    attr_accessor :root_rule_text
    attr_accessor :leaf_rule_text

    handle :some_root_rule do |root_rule|
      self.root_rule_text = root_rule.string
    end

    handle :some_leaf_rule do |leaf_rule|
      self.leaf_rule_text = leaf_rule.string
    end
  end

  traverse = Traverse.new(root_pattern, handler)

  text = Controls::Text.example
  traverse.(text)

  context "Root Rule" do
    root_rule_text = handler.root_rule_text

    comment root_rule_text.inspect

    handled = root_rule_text == text

    test "Handled" do
      assert(handled)
    end
  end

  context "Leaf Rule" do
    leaf_rule_text = handler.leaf_rule_text

    comment leaf_rule_text.inspect

    leaf_rule_text = leaf_rule_text.to_s
    handled = !leaf_rule_text.empty? && text.start_with?(leaf_rule_text)

    test do
      assert(handled)
    end
  end
end
