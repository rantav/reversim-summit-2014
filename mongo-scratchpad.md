# Add comments to wishes
```
db.wishes.find().forEach(function(w){
  w.comments = [];
  db.wishes.save(w);
})
```

# export talks to tsv
```
print('proposal status title type tags submitter email submitter-link votes abstract'.split(' ').join('\t'))
db.proposals.find().sort({createdAt: -1}).forEach(function(p) {
  votes = p.votes;
  voteCount = 0;
  for (v in votes) {
    if (votes[v]) voteCount++;
  }
  abstract = p.abstract;
  abstract = abstract.split('"').join("'");
  abstract = abstract.split('\n').join(" ");
  user = db.users.findOne({_id: p.user_id});
  email = user.profile.email ||
          (user.services.google && user.services.google.email) ||
          (user.services.github && user.services.github.email) ||
          (user.services.facebook && user.services.facebook.email);
  print(["http://summit2014.reversim.com/proposal/" + p._id,
         p.status,
         p.title,
         p.type,
         p.tags,
         user.profile.name,
         email,
         "http://summit2014.reversim.com/speaker/" + p.user_id,
         voteCount,
         '"' + abstract + '"'].join('\t'))
})
```