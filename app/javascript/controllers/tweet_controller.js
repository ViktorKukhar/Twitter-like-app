import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tweet"
export default class extends Controller {
  static targets = ["textarea"]

  connect() {
    this.textareaTarget.style.overflow = 'hidden';
    this.resize();
  }

  resize() {
    this.textareaTarget.style.height = 'auto'; // Reset the height
    this.textareaTarget.style.height = `${this.textareaTarget.scrollHeight}px`; // Adjust height based on content
  }

  clearTextarea() {
    this.textareaTarget.value = "";
  }
}
