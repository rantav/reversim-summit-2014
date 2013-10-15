// Add comments to wishes
db.wishes.find().forEach(function(w){
  w.comments = [];
  db.wishes.save(w);
})