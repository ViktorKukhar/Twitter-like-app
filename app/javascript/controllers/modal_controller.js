import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["container"];

  connect() {
    if (this.hasContainerTarget) {
      this.show();
    }
  }

  show() {
    this.containerTarget.classList.remove("hidden");
  }

  close() {
    this.containerTarget.classList.add("hidden");
  }
}
