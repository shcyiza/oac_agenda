module EventsHelper
  def render_hashtags(edesc)
    edesc.gsub(/#\w+/){|word| link_to word, "/event/hashtag/#{word.downcase.delete('#')}"}.html_safe
  end

  def title_section(event)
  if current_user.folevents.where(:event_id => event.id).count > 0
       render partial: 'events/folwd', locals: {:event => event}
   else
       render partial: 'events/notfolwd', locals: {:event => event}
   end
  end

end
