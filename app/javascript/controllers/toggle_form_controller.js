import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-form"
export default class extends Controller {
  static targets = ["form"]
  connect() {
    // console.log("connected");
  }

  toggle() {
    if (this.formTarget.style.display === "none") {
      this.formTarget.style.display = "";
      this.formTarget.scrollIntoView();
    } else {
      this.formTarget.style.display = "none";
    }
  }
}
