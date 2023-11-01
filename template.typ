#set text(font: "Arial", lang: "en")
#set page(paper: "us-letter")

#let header(
  name: str,
  email: str,
  linkedinUrl: str
) = {
  set align(center)

  text(20pt, weight: "bold", name)

  linebreak()

  text(12pt, {
    email + " | " + linkedinUrl 
  })
}

#let sectionHeader(title: str) = {
  [
    #set align(left)
    #text(16pt, weight: "bold", title)
    #v(-12pt)
    #line(length: 100%)
  ]
}

#let education(
  schools: (str: (
    degree: str,
    major: str,
    graduation: str,
    gpa: str,
    location: str
  ))
) = {
  sectionHeader(title: "Education")

  for (key, value) in schools {
    text(12pt, weight: "bold", {
      value.degree + ", " + value.major + ", " + value.graduation + h(1fr) + "GPA: " + value.gpa
    })

    linebreak()

    text(12pt, {
      key + ", " + value.location
    })

    linebreak()
    linebreak()
  }
}

#let experience(
  roles: (
    str: (
      title: str,
      start: str,
      end: str,
      location: str,
      description: ()
    )
  )
) = {
  sectionHeader(title: "Experience")

  for (key, value) in roles {
    text(12pt, {
      [*#value.title*] + h(1fr) + value.start + " - " + value.end
    })

    linebreak()

    text(12pt, {
      key + ", " + value.location
    })

    linebreak()

    for bullet in value.description {
      list(text(12pt, bullet))
    }
  }
}

#let skills(skills: (str: ())) = {
  sectionHeader(title: "Skills")

  for (key, value) in skills {
    list(
      text(12pt, {
        key + ": " + for i in value.enumerate() {
          if i.at(0) < value.len() - 1 {
            i.at(1) + ", "
          } else {
            i.at(1)
          }
        }
      })
    )
  }
}