import "bootstrap";
import 'select2/dist/css/select2.css';

import { initSelect2 } from '../components/init_select2';
import $ from 'jquery'

initSelect2();

let resultsList = document.getElementById('results');
let searchInput = document.getElementById('search_countries');
searchInput.addEventListener('keyup', (e) => {
  var client = algoliasearch("EZ854SMHEA", "dd68a0c2da477b9cf380a5a7dca05afa");
  var index = client.initIndex('Country');
  index.search(e.currentTarget.value, { hitsPerPage: 10, page: 0 })
    .then(function searchDone(content) {
      resultsList.innerHTML = "";
      if (searchInput.value !== "") {
        content.hits.forEach(function(item) {
          const listItem = `<a href="/packages?utf8=✓&search%5Bcountries%5D=${item.name}&commit=Search"><li class="results-list-item">${item.name}</li></a>`;
          resultsList.insertAdjacentHTML('beforeend', listItem);
        });
      }
    })
    .catch(function searchFailure(err) {
      console.error(err);
    });
});

import { initUpdateNavbarOnScroll } from '../components/navbar';
initUpdateNavbarOnScroll();
