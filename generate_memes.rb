

def header
  "<html>"\
  "<head>"\
  "<style>img{display:block;margin: 2em auto}</style>"\
  "</head>"
end

def body
  if filenames
    "<p><a href='https://github.com/itsgucci/meme/'>link to github so you can use git to git meme</a></p>"\
    "<p>#{filenames.size} memes</p>" + images
  else
    "<p>empty</p>"
  end
  
end
def images
  filenames.map {|filename| image(filename)}.join(" ")
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

def filenames
  @filenames ||= Dir["memes/*.jpg"].sort_by {|filename| File.ctime(filename) }.shuffle
end

def overwrite_index(html)
  File.open("index.html", "w") do |f|
      f.write html
  end
end

overwrite_index header + body + footer
