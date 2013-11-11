class Blog::Markdown
  def initialize(content)
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, prettify: true)
    @content  = content
  end

  def render
    @markdown.render(@content)
  end
end
