class Redcarpet::Render::BlogHTML < Redcarpet::Render::HTML
  def block_code(content, language)
    <<-HTML
      <pre><code>
#{Pygments.highlight(content, lexer: language).gsub(/(\A\<div class=\"highlight\">|\<\/div\>\z)/, '').gsub(/(\A\<pre\>|\<\/pre\>\z)/, '').chomp}
      </code></pre>
    HTML
  end
end
