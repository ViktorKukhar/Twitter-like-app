import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["container"];
  static classes = ["hidden"]

  connect() {
    if (this.hasContainerTarget) {
      this.show();
    }
  }

  show() {
    this.containerTarget.classList.remove(this.hiddenClass);
  }

  close() {
    this.containerTarget.classList.add(this.hiddenClass);
  }
}
