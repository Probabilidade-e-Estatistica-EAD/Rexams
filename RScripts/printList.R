printList <- function(x, out.format = knitr::opts_knit$get("out.format"),
                      environment = "itemize",
                      marker = NULL) {
  if (out.format == "markdown") {
    if (!missing(environment) || !missing(marker)) {
      warning("Ignoring arguments that are not supported for markdown output.")
    }
    out <- sprintf("\n\n%s\n \n", paste("*", x, collapse = "\n"))
  } else {
    if (out.format == "latex") {
      itemCommand <- if (missing(marker)) {
        "\\item"
      } else {
        sprintf("\\item[%s]", marker)
      }
      listEnv <- c(
        sprintf("\\begin{%s}\n", environment),
        sprintf("\n\\end{%s}\n", environment))
      out <- paste(itemCommand, x, collapse = "\n")
      out <- sprintf("%s%s%s", listEnv[1], out, listEnv[2])
    } else {
      stop("Output format not supported.")
    }
  }
  return(knitr::asis_output(out))
}