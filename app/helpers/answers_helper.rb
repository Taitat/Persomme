module AnswersHelper
  def get_characteristic(request)
    @selected_ids = Characteristic.where(id: request.selected_ids.split(","))
    return @selected_ids
  end

  def answered?(question)
    question.answers.each do |answer|
      if answer.user_id == current_user.id
        return true
      else
        return false
      end
    end
  end
end
