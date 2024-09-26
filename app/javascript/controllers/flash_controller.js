import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash"
export default class extends Controller {
  static values = {
    timeout: { type: Number, default: 5000 }
  }

  // determines what will be executed from start
  connect() {
    this.fadeIn();
    this.startTimeout();
  }

  // appearance of message
  fadeIn() {
    this.element.classList.add("opacity-0", "transition-opacity", "duration-500");

    setTimeout(() => {
      this.element.classList.remove("opacity-0");
      this.element.classList.add("opacity-100");
    }, 50);
  }

  // time to fadeOut.
  // set in shared/_flash_messages.html.erb by data-flash-timeout-value="5000"
  startTimeout() {
    setTimeout(() => {
      this.fadeOut();
    }, this.timeoutValue);
  }

  // disappearance of message
  fadeOut() {
    this.element.classList.remove("opacity-100");
    this.element.classList.add("opacity-0");


    setTimeout(() => {
      this.element.remove();
    }, 500);
  }
}
