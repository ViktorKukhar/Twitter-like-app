import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown"
export default class extends Controller {
  static targets = ["dropdown"]
  static classes = ["hidden"]

  connect() {
    document.addEventListener('click', this.clickOutside.bind(this))
  }

  disconnect() {
    document.removeEventListener('click', this.clickOutside.bind(this))
  }

  toggle() {
    console.log(this.hiddenClass)
    this.dropdownTarget.classList.toggle(this.hiddenClass)
  }

  close() {
    this.dropdownTarget.classList.add(this.hiddenClass)
  }

  clickOutside(event) {
    if (!this.element.contains(event.target)) {
      this.close()
    }
  }
}
