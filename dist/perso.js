// Add class `r-fit-text` to the first `h1` element descendant of `title`.
function formatTitleSlides(obj) {
  for (const section of obj.querySelectorAll("section.title-slide")) {
    // Set background.
    section.setAttribute("data-background", "#4d7e65");
  }
}

formatTitleSlides(document);
