module EventsHelper
  def render_hashtags(edesc)
    edesc.gsub(/#\w+/){|word| link_to word, "/event/hashtag/#{word.downcase.delete('#')}"}.html_safe
  end

end
