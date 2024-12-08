// vendor scripts first

$(document).ready(function () {
  initRegistrationPopups();

  if ($('#map').length) {
    initMap();
  }

  if ($('.tags-topbar').length) {
    initCafeFilter();
  }

  if ($('#dropin').length) {
    initPayments();
  }

  if ($('#cafe_profile').length) {
    initGiftSearch();
  }

  if ($('.gift-form').length) {
    initGiftFormDropdown();
  }
});

// init foundation
$(function () {
  $(document).foundation();
});
