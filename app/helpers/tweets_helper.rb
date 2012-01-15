module TweetsHelper
  def format_tweet tweet
    h(tweet.text).gsub(/@([a-z0-9._-]{3,15})/i) do |mention|
      if user = User.find_by_username(mention.from(1))
        content_tag(:span, "@#{link_to user, user}".html_safe, class: "mention").html_safe
      else
        mention
      end
    end.html_safe
  end
end
