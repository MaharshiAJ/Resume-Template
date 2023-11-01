#import "template.typ": *

#let resume = json("resume.json")

#show: {
  header(
    name: resume.name,
    email: resume.email,
    linkedinUrl: resume.linkedin
  )

  education(
    schools: resume.education
  )

  experience(
    roles: {
      resume.experience
    }
  )

  skills(
    skills: resume.skills
  )
}