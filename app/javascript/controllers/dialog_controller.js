import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dialog"
export default class extends Controller {
  connect() {
  }

  close() {
    this.element.removeAttribute('open')
  }
}
