collection @assets

attributes :title, :id
child(:file) { |file|  file.file.url rescue 'n/a' }
