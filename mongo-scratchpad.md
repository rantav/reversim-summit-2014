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
  users = db.users.find({_id: {$in: p.speaker_ids}});
  emails = users.forEach(function(user){
    return user.profile.email ||
          (user.services.google && user.services.google.email) ||
          (user.services.github && user.services.github.email) ||
          (user.services.facebook && user.services.facebook.email);

  });
  speakerPages = p.speaker_ids.map(function(id){return "http://summit2014.reversim.com/speaker/" + id});
  speakerNames = users.map(function(u){return u.profile.name});
  print(["http://summit2014.reversim.com/proposal/" + p._id,
         p.status,
         p.title,
         p.type,
         p.tags,
         speakerNames,
         emails,
         speakerPages,
         voteCount,
         '"' + abstract + '"'].join('\t'))
})
```