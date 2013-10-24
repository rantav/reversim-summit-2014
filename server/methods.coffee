Meteor.methods
  weCanHelpEmail: (name, email, mind) ->
    check([name, email, mind], [String])
    Email.send
      to: 'rs14team@googlegroups.com',
      from: email,
      subject: "Help #{name} make a proposal",
      text: "#{mind}\n\nThank you, #{name} <#{email}>"
