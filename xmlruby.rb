require 'ripper'
require 'ox'
require 'sorcerer'

class XMLRuby
  def self.dump_from_file filename
    rxml = self.dump File.open(filename, "rb")
    filename = "#{filename[0..-4]}.rxml"
    File.open(filename, "w") { |f| f.write(rxml) }
  end

  def self.dump ruby_code
    ast = Ripper::SexpBuilder.new(ruby_code).parse
    Ox.dump(ast)
  end

  def self.load rxml
    ast = Ox.load(rxml, :mode => :object)
    Sorcerer.source(ast)
  end

  def self.run code
    eval(code)
  end

  def self.load_from_file filename
    code = self.load File.open(filename, "rb")
  end

  def self.run_from_file filename
    self.run(self.load_from_file(filename))
  end
end
