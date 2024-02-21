import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="online-indicator"
export default class extends Controller {

static values = {
  user: Object,
  userId: Number,
  lastSeen: Date(),
}

  connect() {
    console.log(this.userIdValue)
    console.log(this.userValue)
    console.log(this.lastSeenValue)
    // console.log(`/users/${currentUserId}/edit`)
    // console.log(Date.now())
  }
}
