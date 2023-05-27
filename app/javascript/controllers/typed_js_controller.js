import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

// Connects to data-controller="typed-js"
export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Still very empty here", "Create your watchlists!"],
      typeSpeed: 50,
      loop: false
    })
  }
}
