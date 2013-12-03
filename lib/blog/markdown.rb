class Blog::Markdown
  def initialize(content)
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::BlogHTML, autolink: true, fenced_code_blocks: true, tables: true)
    @content  = content
  end

  def render
    @markdown.render(@content)
  end
end
