module FlashesHelper
  def flashes
    safe_join(flash.keys.map do |key|
      content_tag :div, class: ["alert-message", key.to_s.parameterize, ("info" if key == :notice), ("error" if key == :alert)], data: {alert: true} do
        %{<a href="#" class="close">&times;</a>}.html_safe <<
        flash[key]
      end
    end)
  end
end
