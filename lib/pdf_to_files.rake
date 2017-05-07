desc 'Start catching files'
task :pdf_to_file do 
  require 'tabula'
  directory_name = 'output_files'
  unless File.exists?(directory_name)
    Dir.mkdir(directory_name)
    Dir.glob('pdfs/*.pdf') do |rb_file|
    # do work on files ending in .rb in the desired directory
      filename = File.expand_path(rb_file)
      puts "working on extracting #{rb_file}"
      clear_filename = File.basename(filename, '.pdf')
      pdf_files_folder = "#{directory_name}/#{clear_filename}"
      Dir.mkdir(pdf_files_folder) unless File.exists?(pdf_files_folder)
      extractor = Tabula::Extraction::ObjectExtractor.new(filename, :all)
      extractor.extract.each_with_index do |pdf_page, index|
        pdf_page.spreadsheets.each do |spreadsheet|
          out = open("#{pdf_files_folder}/#{index}.csv", 'w')
          out << spreadsheet.to_csv
          out << "\n\n"
          out.close
        end
      end 
    end
  end
end
