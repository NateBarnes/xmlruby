require "xmlruby"
require "pry"
require "minitest/autorun"

class TestXMLRuby < MiniTest::Unit::TestCase
  def test_dump
    assert_equal XMLRuby.dump("def a; end"), "<a>\n  <m>program</m>\n  <a>\n    <m>stmts_add</m>\n    <a>\n      <m>stmts_new</m>\n    </a>\n    <a>\n      <m>def</m>\n      <a>\n        <m>@ident</m>\n        <s>a</s>\n        <a>\n          <i>1</i>\n          <i>4</i>\n        </a>\n      </a>\n      <a>\n        <m>params</m>\n        <z/>\n        <z/>\n        <z/>\n        <z/>\n        <z/>\n      </a>\n      <a>\n        <m>bodystmt</m>\n        <a>\n          <m>stmts_add</m>\n          <a>\n            <m>stmts_new</m>\n          </a>\n          <a>\n            <m>void_stmt</m>\n          </a>\n        </a>\n        <z/>\n        <z/>\n        <z/>\n      </a>\n    </a>\n  </a>\n</a>\n"
  end

  def test_run
    rxml = XMLRuby.dump("$xmlruby = 1")
    $xmlruby = 2
    XMLRuby.run(XMLRuby.load(rxml))
    assert_equal $xmlruby, 1
  end
end
