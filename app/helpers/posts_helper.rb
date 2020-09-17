module PostsHelper
  def get_characteristic(post)
    @selected_ids = Characteristic.where(id: post.question.requests[0].selected_ids.split(","))
    return @selected_ids
  end

end
