

def header
  "<html>"\
  "<head>"\
  "<style>img{display:block}</style>"\
  "</head>"
end

def body
  if filenames = Dir["memes/*.jpg"]
    filenames.sort_by {|filename| File.ctime(filename) }.reverse.map {|filename| image(filename)}.join(" ")
  else
    "<p>empty</p>"
  end
  
end

def image(filename)
  # markdown?
  # "![me meme](memes/#{filename})"
  
  # html
  "<img src='#{filename}' />"
end

def footer
  "</html>"
end

def overwrite_index(html)
  File.open("index.html", "w") do |f|
      f.write html
  end
end

overwrite_index header + body + footer
