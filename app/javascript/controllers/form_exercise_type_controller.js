import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["select", "weight", "time"]

  toggle() {
    //https://developer.mozilla.org/en-US/docs/Web/API/HTMLSelectElement

    const selected = this.selectTarget.selectedOptions[0]
    const type = selected.dataset.exerciseType


    if (type === "time") {
      this.timeTarget.classList.remove("hidden")
      this.weightTarget.classList.add("hidden")
    } else {
      this.weightTarget.classList.remove("hidden")
      this.timeTarget.classList.add("hidden")
    }
  }
}
