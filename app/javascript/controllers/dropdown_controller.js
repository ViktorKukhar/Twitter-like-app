import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown"
export default class extends Controller {
  static targets = ["dropdown"]

  connect() {
    document.addEventListener('click', this.clickOutside.bind(this))
  }

  disconnect() {
    document.removeEventListener('click', this.clickOutside.bind(this))
  }

  toggle() {
    this.dropdownTarget.classList.toggle("hidden")
  }

  close() {
    this.dropdownTarget.classList.add("hidden")
  }

  clickOutside(event) {
    if (!this.element.contains(event.target)) {
      this.close()
    }
  }
}
