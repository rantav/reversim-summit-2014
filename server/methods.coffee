Meteor.methods
  weCanHelpEmail: (name, email, mind) ->
    check([name, email, mind], [String])
    Email.send
      to: 'rs14team@googlegroups.com',
      from: email,
      subject: "Help #{name} make a proposal",
      text: "#{mind}\n\nThank you, #{name} <#{email}>"

  sendSubmitEmail: (p) ->
    u = User.find(p.speaker_ids[0])
    email = u.email()
    baseUrl = Meteor.absoluteUrl()
    proposalUrl = "#{baseUrl}proposal/#{p.id}"
    userUrl = "#{baseUrl}speaker/#{u.id}"
    if email
      Email.send
        to: email
        cc: 'rs14team@googlegroups.com'
        from: 'rs14team@googlegroups.com'
        subject: "#{u.name()}, thanks for submitting to Reversim Summit: #{p.title}",
        text: "Title: #{p.title}\nType: #{p.type}\nAbstract: #{p.abstract}\n\n\nYou may edit your profile here #{userUrl} and edit your submission until Jan 1st here #{proposalUrl}"
    else
      Email.send
        to: 'rs14team@googlegroups.com'
        from: 'rs14team@googlegroups.com'
        subject: "#{u.name()} submitted a new talk: #{p.title}",
        text: "Title: #{p.title}\nType: #{p.type}\nAbstract: #{p.abstract}\n\n\nAnd it's here #{proposalUrl} (the user did not supply an email address)"
