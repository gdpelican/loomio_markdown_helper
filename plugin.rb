module Plugins
  module LoomioMarkdownHelper
    class Plugin < Plugins::Base
      setup! :loomio_markdown_helper do |plugin|
        plugin.enabled = true
        plugin.use_component :markdown_helper, outlet: :after_comment_input
      end
    end
  end
end
