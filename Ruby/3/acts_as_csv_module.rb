module ActsAsCsv
	def self.included(base)
		base.extend ClassMethods
	end
	
	module ClassMethods
		def acts_as_csv
			include InstanceMethods
		end
	end
	
	module InstanceMethods
		def read
			@csv_contents = []
			filename = self.class.to_s.downcase + '.txt'
			file = File.new(filename)
			@headers = file.gets.chomp.split(',')
			
			file.each do |row|
				@csv_contents << CsvRow.new(row, self)
			end
		end
		
		attr_accessor :headers, :csv_contents
		
		define_method 'initialize' do
			read
		end
		
		def each
			@csv_contents.each { |csvrow| yield(csvrow) }
		end
		
		
	end
	
	class CsvRow
		attr_accessor :csv_row, :container
		
		def initialize(myrow, container)
			@container = container
			@csv_row = Array.new( myrow.chomp.split(',') )
		end
		
		def to_s
			@csv_row.to_s
		end
		
		def method_missing sym, *args
			idx = container.headers.index(sym.to_s)
			if(idx == nil) then
				nil
			else
				csv_row[idx]
			end
		end
	end
	
end

class RubyCsv 
	include ActsAsCsv
	acts_as_csv
end

	
	m = RubyCsv.new
	puts m.headers.inspect
	puts m.csv_contents.inspect
	m.each { |rcsv| puts "row #{rcsv}" }
	m.each { |rcsv| puts "meenie #{rcsv.meenie}"}