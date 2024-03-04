import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-note"
export default class extends Controller {
  static targets = ["note", "form", "card"]

  displayForm() {
    this.noteTarget.classList.add("d-none")
    this.formTarget.classList.remove("d-none")

    console.log("is this working?")
    console.log(this.formTarget.action)
  }

  update(event) {
    event.preventDefault()
    const url = this.formTarget.action
    fetch(url, {
      method: "PATCH",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.formTarget)
    })
    .then(response => response.text())
    .then((data) => {
      console.log(data)
      this.cardTarget.outerHTML = data
    })
  }
}
