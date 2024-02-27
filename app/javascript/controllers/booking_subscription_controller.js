import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { bookingId: Number }
  static targets = ["messages"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "BookingChannel", id: this.bookingIdValue },
      { received: data => this.insertMessageAndScrollDown(data) }
    )
    console.log(`Subscribed to the booking with the id ${this.bookingIdValue}.`)
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }

  resetForm(event) {
    console.log("Form submitted");
    event.target.reset();
  }

  insertMessageAndScrollDown(data) {
    console.log("Received message data:", data);
    // Check if messages target is available
    if (this.hasMessagesTarget) {
      this.messagesTarget.insertAdjacentHTML("beforeend", data);
      // Scroll logic
      this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight);
    } else {
      console.error("Messages target not available.");
    }
  }
}
