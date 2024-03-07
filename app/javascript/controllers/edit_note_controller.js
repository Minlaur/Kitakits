import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-note"
export default class extends Controller {
  static targets = ["note", "form", "card"]

  displayForm() {
    this.noteTarget.classList.add("d-none")
    this.formTarget.classList.remove("d-none")

    console.log("is this working?")
  }
}
