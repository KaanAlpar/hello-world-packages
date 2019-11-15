import "bootstrap";
import 'select2/dist/css/select2.css';

import { initSelect2 } from '../components/init_select2';
import $ from 'jquery'

initSelect2();

document.getElementById('search_countries').addEventListener('keyup', (e) => {
  var client = algoliasearch("EZ854SMHEA", "dd68a0c2da477b9cf380a5a7dca05afa");
  var index = client.initIndex('Package');
  index.search(e.currentTarget.value, { hitsPerPage: 10, page: 0 })
    .then(function searchDone(content) {
      content.hits.forEach(function(item) {
        console.log(item.name);
      });
      console.log('---------------------------------')
    })
    .catch(function searchFailure(err) {
      console.error(err);
    });
});

import { initUpdateNavbarOnScroll } from '../components/navbar';
initUpdateNavbarOnScroll();
