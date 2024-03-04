import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["togglableElement", "secondTogglableElement"]

  connect() {

  }
  fire() {
    this.togglableElementTarget.classList.toggle("d-none");
    this.secondTogglableElementTarget.classList.toggle("d-none");
  }
}
