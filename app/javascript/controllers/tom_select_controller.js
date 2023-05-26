import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select";

// Connects to data-controller="tom-select"
export default class extends Controller {
  static values = { options: Object }
  // TODO: Fix this
  connect() {
    console.log("connected Tomselect")
    var selector = new TomSelect(
      this.element,
      this.optionsValue
      )

    console.log(selector)
  }
}
