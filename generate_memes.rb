

def header
  ""
end

def body
  if filenames = Dir["memes/*.jpg"]
    filenames.sort_by {|filename| File.mtime(filename) }.map {|filename| image(filename)}.join(" ")
  else
    "<p>empty</p>"
  end
  
end

def image(filename)
  # markdown?
  # "![me meme](memes/#{filename})"
  
  # html
  "<img src='memes/#{filename}' />"
end

def footer
  ""
end

def overwrite_index(html)
  File.open("index.html", "w") do |f|
      f.write html
  end
end

overwrite_index header + body + footer
