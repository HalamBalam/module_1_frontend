import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ "source" ]
  static classes = [ "supported" ]

  //v1 - with a button, using the browswer Clipboard API
  copy() {
    this.sourceTarget.select()
    navigator.clipboard.writeText(this.sourceTarget.value)
  }

  connect() {
    navigator.permissions.query({ name: 'clipboard-write' }).then( (result) => {
      if (result.state == "granted") {
        this.element.classList.add(this.supportedClass)
      }
    })
  }
}