import "bootstrap";
import 'select2/dist/css/select2.css';

import { initSelect2 } from '../components/init_select2';

initSelect2();

let resultsList = document.getElementById('results');
document.getElementById('search_countries').addEventListener('keyup', (e) => {
  var client = algoliasearch("EZ854SMHEA", "dd68a0c2da477b9cf380a5a7dca05afa");
  var index = client.initIndex('Country');
  index.search(e.currentTarget.value, { hitsPerPage: 10, page: 0 })
    .then(function searchDone(content) {
      resultsList.innerHTML = "";
      content.hits.forEach(function(item) {
        const listItem = `<li class="results-list-item">${item.name}</li>`;
        resultsList.insertAdjacentHTML('beforeend', listItem);
      });
    })
    .catch(function searchFailure(err) {
      console.error(err);
    });
});
