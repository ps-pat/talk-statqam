function formatTitleSlides(obj) {
  for (const section of obj.querySelectorAll("section.title-slide")) {
    // Set background.
    section.setAttribute("data-background", "#4d7e65");
  }
}

formatTitleSlides(document);

$(document).ready(function() {

  // Add link to references.
  $(".reference").wrapInner("<a href=#/references></a>");

});
