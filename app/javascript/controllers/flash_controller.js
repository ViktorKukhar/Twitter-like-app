import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash"
export default class extends Controller {
  static values = {
    timeout: { type: Number, default: 5000 }
  }

  connect() {
    this.fadeIn();
    this.startTimeout();
  }

  fadeIn() {
    this.element.classList.add("opacity-0", "transition-opacity", "duration-500");

    setTimeout(() => {
      this.element.classList.remove("opacity-0");
      this.element.classList.add("opacity-100");
    }, 50); // Small delay to trigger the transition
  }

  startTimeout() {
    setTimeout(() => {
      this.fadeOut();
    }, this.timeoutValue);
  }

  fadeOut() {
    // Apply the fade-out transition
    this.element.classList.remove("opacity-100"); // Start fading out
    this.element.classList.add("opacity-0"); // Transition to invisible

    // After the transition, remove the element from the DOM
    setTimeout(() => {
      this.element.remove();
    }, 500); // Match the transition duration with the time (500ms)
  }
}
