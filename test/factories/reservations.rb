Factory.define :reservation do |f|
  f.association :book
  f.state 'free'
  f.association :user
  #f.email 'library@eficode.com'
end