module ApplicationHelper
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
