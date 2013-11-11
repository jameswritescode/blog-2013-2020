class Redcarpet::Render::BlogHTML < Redcarpet::Render::HTML
  def block_code(content, language)
    Pygments.highlight(code, lexer: language)
  end
end
