import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="project-events"
export default class extends Controller {
  static values = {
    projectId: Number
  }

  connect() {
    this.loadEvents()
  }

  loadEvents() {
    fetch(`/projects/${this.projectIdValue}/project_events`, {
      headers: {
        "X-Requested-With": "XMLHttpRequest",
        "Accept": "text/javascript"
      }
    })
    .then(response => {
      if (!response.ok) throw new Error("Network response was not ok")
      return response.text()
    })
    .then(js => {
      eval(js)
    })
    .catch(error => {
      console.error("Error loading events:", error)
    })
  }
}
