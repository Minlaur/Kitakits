import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  connect() {
    flatpickr(this.element,{
      enableTime: true,
      dateFormat: "Y-m-d H:i",
      noCalendar: true,
      minTime: "16:00",
      maxTime: "22:30",
    })
  }
}
