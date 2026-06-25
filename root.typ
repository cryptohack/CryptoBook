#context assert(target() == "bundle", message: "Please compile this file only with `--format bundle`")

#let meta = (
    // index.typ, implicitly, as front page
    ("Coordination", (
        "todo.typ",
        "style-guide/index.typ",
        "contributors.typ",
    )),
    ("Fundamentals", (
        "fundamentals/notation.typ",
        "fundamentals/division-and-gcd/index.typ",
    )),
)

#set heading(numbering: "1.1")

#let filelabel(file) = label("doc::" + file.replace("/", ":").replace(".typ", ""))

#let nav(chapter) = {
  let content = meta.map(((title, chapters)) => {
    strong(title);
    list(..chapters.map((file) => {
      import file as _file
      if file == chapter {
        html.a(_file.title, class: "current", tabindex: -1)
      } else {
        link(filelabel(file), _file.title)
      }
    }))
  }).join()

  html.nav({
    html.div(class: "desktop-nav", content)
    html.details(class: "mobile-nav", html.summary("Navigation") + content)
  })
}

#let prev_next(chapter) = {
  let flat = meta.map(((_, chapters)) => chapters).sum(default: ())
  let index = flat.position(c => c == chapter)
  if index == none {
    index = -1
  }

  html.nav(class: "prev-next",
    html.div(class: "prev",
      if index == 0 {
        link(filelabel("index.typ"), "CryptoBook")
      } else if index > 0 {
        let file = flat.at(index - 1)
        import file as _file
        link(filelabel(file), _file.title)
      }
    )
    +
    html.div(class: "next",
      if index < flat.len() - 1 {
        let file = flat.at(index + 1)
        import file as _file
        link(filelabel(file), _file.title)
      }
    )
  )
}

#let chapter(filename) = [
  #let out = filename.replace(".typ", ".html")
  #import filename: title
  #document(out, title: title, {
      html.link(href: "/css/style.css", rel: "stylesheet")
      heading(numbering: none, link(<doc::index>, "CryptoBook"))
      nav(filename)
      html.main({
        heading(level: 1, title)
        set heading(offset: 1)
        include filename
      })
      prev_next(filename)
  })#filelabel(filename)
]

#asset("css/style.css", read("css/style.css"))

#chapter("index.typ")

#for (partname, part) in meta {
  for file in part {
    chapter(file)
  }
}

