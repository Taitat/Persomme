module AnswersHelper
  def get_characteristic(request)
      @selected_ids = Characteristic.where(id: request.selected_ids.split(","))
      return @selected_ids
  end
end
