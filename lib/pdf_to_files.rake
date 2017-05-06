desc "Start catching files"
task :pdf_to_file do 
  require 'pdf-reader'
  Dir.glob('pdfs/*.pdf') do |rb_file|
  # do work on files ending in .rb in the desired directory
    filename = File.expand_path(rb_file)
    puts rb_file
    
    reader = PDF::Reader.new(filename)
    # puts reader.pdf_version
    # puts reader.info
    # puts reader.metadata
    # puts reader.page_count
    directory_name = "output_htmls"
    Dir.mkdir(directory_name) unless File.exists?(directory_name)
    File.open("#{directory_name}/#{File.basename(filename, '.pdf')}.html", 'w') do |output_file|
      reader.pages.each do |page|
        output_file.write page.text 
      end
    end  
  end
end
