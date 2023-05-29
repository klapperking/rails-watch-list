import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  connect() {
    // Index Page transparent, else sticky-top
    const current = window.location.href
    if (!((current.split('/').length - 1)  === 3)) {
      this.element.classList.remove('fixed-top')
      this.element.classList.add('sticky-top', 'top-0')
      this.element.classList.add('navbar-lewagon-white')

    } else {
      this.element.classList.remove('sticky-top')
      this.element.classList.add('fixed-top')

    }
  }

  updateNavbar() {
    const current = window.location.href
    if (window.scrollY >= (window.innerHeight / 2)) {
      this.element.classList.add("navbar-lewagon-white")

    } else {
      // scroll up on index page (not-non-index) - remove the white.
      if ((current.split('/').length - 1)  === 3) {
        this.element.classList.remove('navbar-lewagon-white')
      }
    }
  }

}
