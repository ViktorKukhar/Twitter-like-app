import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["loginModal", "signupModal"];

  connect() {
    console.log("Modal controller connected");
  }

  // Open the login modal
  openLoginModal(event) {
    event.preventDefault();
    this.loginModalTarget.classList.remove("hidden");  // Show the login modal
    this.loginModalTarget.classList.add("flex");       // Tailwind's flex for centering
  }

  // Close the login modal
  closeLoginModal(event) {
    event.preventDefault();
    this.loginModalTarget.classList.add("hidden");     // Hide the login modal
    this.loginModalTarget.classList.remove("flex");    // Remove the centering
  }

  // Open the sign-up modal
  openSignupModal(event) {
    event.preventDefault();
    this.signupModalTarget.classList.remove("hidden");  // Show the signup modal
    this.signupModalTarget.classList.add("flex");       // Tailwind's flex for centering
  }

  // Close the sign-up modal
  closeSignupModal(event) {
    event.preventDefault();
    this.signupModalTarget.classList.add("hidden");     // Hide the signup modal
    this.signupModalTarget.classList.remove("flex");    // Remove the centering
  }
}
