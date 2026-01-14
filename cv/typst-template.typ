#let article(
  title: none,
  cols: 1,
  font: "libertinus serif",
  fontsize: 11pt,
  title-size: 1.5em,
  subtitle-size: 1.25em,
  heading-family: "libertinus serif",
  // Unused arguments for CV PDF but needed for Quarto render
  toc_title: "Table of content",
  toc_depth: 3,
  //
  doc,
) = {
  set par(justify: true)
  // Configure text properties
  set text(
    font: "libertinus serif",
    size: 11pt
  )
  // Configure page properties
  set page(
    paper: "us-letter",
    margin: (x: 2.1cm, y: 2.1cm)
  )
  align(center, text(18pt, title))
  doc
}

#let justify_align(left_body, right_body) = {
  block[
    #box(width: 4fr)[#left_body]
    #box(width: 1fr)[
      #align(right)[
        #right_body
      ]
    ]
  ]
}

#let secondary_right_header(body) = {
  context {
    set text(
      size: 10pt,
      weight: "bold",
      fill: black,
    )
    body
  }
}

#let justified_header(primary, secondary, font_size: 12pt) = {
  set block(
    above: 0.7em,
    below: 0.7em,
  )
  pad[
    #justify_align[
      #set text(
        size: font_size,
        weight: "bold",
        fill: black,
      )
      #primary
    ][
      #secondary_right_header[#secondary]
    ]
  ]
}

#let underline_header(body, font_size: 12pt) = {
    [
        #set text(
            size: font_size,
            weight: "bold",
            fill: black,
        )
        #body
        #line(length: 100%, stroke: (paint: rgb("#1f77b4")))
    ]
}

#show heading.where(level: 1): it => [
  #underline_header(it.body)
]