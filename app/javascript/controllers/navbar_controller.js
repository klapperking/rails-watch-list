import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  connect() {
    // Index Page transparent, else sticky-top
    const current = window.location.href
    if ((current.endsWith("lists")) || (current.endsWith("lists#"))) {
      this.element.classList.remove('sticky-top')
      this.element.classList.add('fixed-top')
    } else {
      console.log("Stick-page")
      this.element.classList.remove('fixed-top')
      this.element.classList.add('sticky-top', 'top-0')
      this.element.classList.add('navbar-lewagon-white')
    }
  }

  updateNavbar() {
    if (window.scrollY >= (window.innerHeight / 2)) {
      this.element.classList.add("navbar-lewagon-white")

    } else {
      if (!(current.endsWith('lists') || current.endsWith('lists#'))) {
        this.element.classList.remove("navbar-lewagon-white")
      }
    }
  }

}
