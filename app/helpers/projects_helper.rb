module ProjectsHelper
  def form_input_class(model, field)
    base = "w-full px-4 py-2 rounded-md border shadow-sm "
    base += model.errors[field].any? ? "border-red-500 focus:outline-red-600" : "border-gray-300 focus:ring-blue-500 focus:border-blue-500"
    base
  end

  def status_badge(status)
    base_classes = "inline-block rounded-full text-sm px-3 py-1 font-medium shadow-sm"

    color_classes = {
      draft:    "bg-gray-200 text-gray-800",
      pending:  "bg-yellow-100 text-yellow-800",
      active:   "bg-blue-100 text-blue-800",
      archived: "bg-gray-300 text-gray-700",
      completed: "bg-green-100 text-green-800"
    }

    status_sym = status.to_s.downcase.to_sym
    content_tag :span, status.to_s.titleize, class: "#{base_classes} #{color_classes[status_sym] || 'bg-gray-100 text-gray-800'}"
  end
end
