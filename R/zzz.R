.onAttach <- function(libname, pkgname) {
  packageStartupMessage(
    "uwbranding: UW\u2013Madison brand identity for R and Quarto.\n",
    "Fonts required: Crimson Pro, Red Hat Display, Red Hat Text\n",
    "Download: https://brand.wisc.edu/visual-identity/typography/"
  )
}
