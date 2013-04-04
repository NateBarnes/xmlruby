require 'ripper'
require 'ox'

class XMLRuby
  def self.dump_from_file filename
    rxml = self.dump File.open(filename, "rb")
    filename = "#{filename[0..-4]}.rxml"
    File.open(filename, "w") { |f| f.write(rxml) }
  end

  def self.dump ruby_code
    ast = Ripper.sexp(ruby_code)
    Ox.dump(ast)
  end

  def self.load rxml
    ast = Ox.load(rxml, :method => :object)
  end
end

XMLRuby.dump_from_file ARGV[0]
