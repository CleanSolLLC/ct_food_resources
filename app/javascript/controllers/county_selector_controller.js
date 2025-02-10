import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="county-selector"
export default class extends Controller {
  connect() {
    console.log("County selector connected")
  }

  fetchPantries(event) {
    const countyId = event.target.value;
    if (countyId) {
      fetch(`/counties/${countyId}/food_pantries`, {
        headers: {
          Accept: "text/vnd.turbo-stream.html"
        }
      })
        .then(response => response.text())
        .then(html => {
          document.getElementById("food-pantries").innerHTML = html;
        })
    }
  }

}
