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
    // const url = `/users/${userId}/edit`
    // console.log(`/users/sample/edit`)
    // console.log(`/users/${currentUserId}/edit`)

  }
}
