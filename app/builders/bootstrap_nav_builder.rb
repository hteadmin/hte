class BootstrapNavBuilder < TabsOnRails::Tabs::Builder
  def open_tabs(options = {})
      @context.tag("ul", options, open = true)
    end

    def close_tabs(options = {})
      "</ul>".html_safe
    end

    def tab_for(tab, name, options, item_options = {})
      active = (current_tab?(tab) ? 'active' : '')
      @context.content_tag(:li, item_options) do
        @context.link_to(name, options, class: active)
      end
    end

    # def tab_for(tab, name, options={}, item_options = {}, &block)
    #   options[:class] = options[:class].to_s.split(" ").push("active").join(" ") if current_tab?(tab)
    #   content = @context.link_to(name, options)
    #   content += @context.capture(&block) if block_given?
    #   @context.content_tag(:li, content, item_options)
    # end
end