module ApplicationHelper
  require "redcarpet"
  require "coderay"

  class HTMLwithCoderay < Redcarpet::Render::HTML
      def block_code(code, language)
          language = language.split(':')[0] if language.present?

          case language.to_s
          when 'rb'
              lang = :ruby
          when 'yml'
              lang = :yaml
          when 'css'
              lang = :css
          when 'html'
              lang = :html
          when ''
              lang = :md
          else
              lang = language
          end

          CodeRay.scan(code, lang).div
      end
  end

  def markdown(text)
      html_render = HTMLwithCoderay.new(
        filter_html: true,
        hard_wrap: true,
        link_attributes: { rel: 'nofollow', target: "_blank" }
      )
      options = {
          autolink: true,
          space_after_headers: true,
          no_intra_emphasis: true,
          fenced_code_blocks: true,
          tables: true,
          hard_wrap: true,
          xhtml: true,
          lax_html_blocks: true,
          strikethrough: true
      }
      markdown = Redcarpet::Markdown.new(html_render, options)
      markdown.render(text)
  end

  # デバイスのエラーメッセージ出力メソッド(親クラスのメソッドの上書き処理)
  def bootstrap_devise_error_messages!
    return "" if resource.errors.empty?
    html = ""
    # エラーメッセージ用のHTMLを生成
    resource.errors.full_messages.each do |error_msg|
      html += <<-EOF
      <div class="alert alert-danger alert-dismissible" role="alert">
      <button type="button" class="close" data-dismiss="alert">
        <span aria-hidden="true">&times;</span>
        <span class="sr-only">close</span>
      </button>#{error_msg}
      </div>
      EOF
    end
    html.html_safe
  end
end
