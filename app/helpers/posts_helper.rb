module PostsHelper
  
  def translator(text)
    project_id = ENV["august-upgrade-288810"]
    translate = Google::Cloud::Translate.new version: :v2, project_id: project_id
    if text =~ /(?:\p{Hiragana}|\p{Katakana}|[一-龠々])/
      @text = text
      target = "en"
      @translation = translate.translate @text, to: target
    else
      @text = text
      target = "ja"
      @translation = translate.translate @text, to: target

    end

  end
end
