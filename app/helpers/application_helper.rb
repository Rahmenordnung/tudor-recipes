module ApplicationHelper

  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.chefname, class: "img-circle")
  end
  
  def image_for(recipe)
    @default_img = recipe.image
    if @default_img.empty?
        @default_img = image_tag("No-image-available.jpg")
    else
        @default_img = image_tag(@default_img.url)
    end
    return @default_img
end

end