module UiHelper
  def gradient_border_form_section(&block)
    content_tag(:div, class: "rounded-3xl p-[2px] bg-gradient-to-r from-pink-500 via-red-500 to-yellow-500") do
      content_tag(:div, capture(&block), class: "bg-[oklch(98.5%_0_0)] rounded-[calc(1.5rem-1px)] px-2 py-2")
    end
  end

  def gradient_input_wrapper(&block)
    content_tag(:div, class: "rounded p-px bg-gradient-to-r from-pink-500 via-red-500 to-yellow-500 inline-block") do
      content_tag(:div, class: "bg-white w-full rounded") do
        capture(&block)
      end
    end
  end

  def gradient_form_submit(form, label_text = "Submit")
    form.submit(label_text, class: "block mx-auto text-white font-semibold px-2 py-1 bg-gradient-to-r from-pink-500 via-red-500 to-yellow-500 rounded-md")
  end
end
