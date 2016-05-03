json.array! @pubs.each do |pub|
  json.id pub.id
  json.name pub.name
  json.address1 pub.address1 
  json.address2 pub.address2
  json.city pub.city
  json.state pub.state
  json.zip pub.zip
  json.phone pub.phone
  json.fax pub.fax
  json.website pub.website
  json.map pub.map
  json.email pub.email
end