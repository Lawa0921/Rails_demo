import { Controller } from "stimulus";
import axios from "axios";

export default class extends Controller {
  static targets = ["icon"];

  initialize() {
    this.clicked = false;
  }

  heart(e) {
    e.preventDefault();

    const csrfToken = document.querySelector("[name=csrf-token]").content;
    axios.defaults.headers.common["X-CSRF-TOKEN"] = csrfToken;

    axios
      .post("/api/v1/items/9/favorite")
      .then(function (resp) {
        console.log(resp.data);
      })
      .catch(function (err) {
        console.log(err);
      });
  }
}

// console.log("heart is clicked!");
// if (this.clicked) {
//   this.iconTarget.classList.remove("fas");
//   this.iconTarget.classList.add("far");
//   this.clicked = false;
// } else {
//   this.iconTarget.classList.remove("far");
//   this.iconTarget.classList.add("fas");
//   this.clicked = true;
// }
