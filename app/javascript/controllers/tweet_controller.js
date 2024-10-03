import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tweet"
export default class extends Controller {
  static targets = ["textarea"]

  clearTextarea() {
    this.textareaTarget.value = "";
  }
}
