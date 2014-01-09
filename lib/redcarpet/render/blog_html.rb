class Redcarpet::Render::BlogHTML < Redcarpet::Render::HTML
  include Redcarpet::Render::SmartyPants

  def block_code(content, language)
    <<-HTML
      <pre><code>
#{Pygments.highlight(content, lexer: language).gsub(/(\A\<div class=\"highlight\">|\<\/div\>\z)/, '').gsub(/(\A\<pre\>|\<\/pre\>\z)/, '').chomp}
      </code></pre>
    HTML
  end

  def preprocess(full_document)
    full_document.gsub(/@\[(.*)\]\((.*)\)/) do
      <<-HTML
<a href="#{$2}"><img src="#{$2}" alt="#{$1}" /></a>
      HTML
    end
  end
end
