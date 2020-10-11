module AnswersHelper
  def get_characteristic(request)
    @selected_ids = Characteristic.where(id: request.selected_ids.split(","))
    return @selected_ids
  end

  def answered?(question)
    binding.pry
    answer_users = question.answers.pluck(:user_id)
    if answer_users.include?(current_user.id)
      return true
    else
      return false
    end
  end
end
