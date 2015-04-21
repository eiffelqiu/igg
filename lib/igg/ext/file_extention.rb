#
# adding new methods to File class
#
class File
  # return minified content
  def minify(content)
    # remove comments
    content.gsub!(/((?:\/\*(?:[^*]|(?:\*+[^*\/]))*\*+\/)|(?:\/\/.*))/, '')
    
    # remove new lines
    content.gsub!(/\n/, ' ')
    
    # remove spaces more then 1
    content.gsub!(/\s+/, ' ')
  end
  
  # save minified contents into a new file
  def save_minified(content, filename)
    filename = filename.split('.')
    
    ext = filename.pop
    filename = filename.join('.') + '.min.' + ext
    
    f = File.new(filename, 'w')
    f.write(content)
    f.close
  end
end