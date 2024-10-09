import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tweet"
export default class extends Controller {
  static targets = ["textarea", "submit", "count"]

  connect() {
    this.maxLength = 280; // app/models/tweet.rb/ validates :body, length: { minimum: 1, maximum: 280 }
    this.resize();
    this.checkLength();
  }

  resize() {
    this.textareaTarget.style.height = 'auto'; // Reset the height
    this.textareaTarget.style.height = `${this.textareaTarget.scrollHeight}px`; // Adjust height based on content
  }

  clearTextarea() {
    this.textareaTarget.value = "";

    this.checkLength();
  }

  checkLength() {
    const textLength = this.textareaTarget.value.length;
    const remainingChars = this.maxLength - textLength;

    this.countTarget.innerHTML = `${remainingChars}`;

    // Check if the text length exceeds the limit
    if (remainingChars < 0) {
      this.textareaTarget.classList.add("!text-red-500");
      this.countTarget.classList.add("text-red-500")
      this.submitTarget.disabled = true;
    } else if (textLength === 0) {
      this.submitTarget.disabled = true;
    } else {
      this.textareaTarget.classList.remove("!text-red-500");
      this.countTarget.classList.remove("text-red-500")
      this.submitTarget.disabled = false;
    }

    if (this.submitTarget.disabled) {
      this.submitTarget.classList.add("opacity-50");
    } else {
      this.submitTarget.classList.remove("opacity-50");
    }

  }
}
