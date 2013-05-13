# http://edgeguides.rubyonrails.org/4_0_release_notes.html
[
  {:title => "Planning",      :position => 1},
  {:title => "Implementing",  :position => 2},
  {:title => "Completed",     :position => 3},
  {:title => "Maintaining",   :position => 4}
].each do |attributes|
  Status.find_or_create_by_title(attributes)
end

puts "#{Status.count} statuses have been created only if needed."
