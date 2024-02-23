import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="online-indicator"
export default class extends Controller {

static values = {
  user: Object,
  userId: Number,
  lastSeen: Date(),
  // added () to assign a value, lastSeen is connected to application.html.erb data value for DateTime.now, this returns in this format: 2024-02-21T10:26:52+09:00
}

  connect() {
    console.log(this.userIdValue)
    console.log(this.userValue)
    console.log(this.lastSeenValue)
    const url = `/users/${this.userIdValue}/`;
    console.log(url)
    // need to verify CSRF token authenticity mentioned in the head of application.html.erb
    const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

    // to update the last_seen value
    const form = new FormData();
    // previously "user[last_seen]"; replace back as it seems not working
    form.append(`user[last_seen]`, new Date(this.lastSeenValue));

    fetch(url, {
      method: "PATCH",
      headers: {"X-CSRF-Token": csrfToken,},
      body: form
    })

    .then(response => {
      if (response.ok) {
        console.log("Last seen updated successfully");
      } else {
        console.error("Failed to update last seen");
      }
    })
    .catch(error => {
      console.error("Error updating last seen:", error);
    });
  }
}
