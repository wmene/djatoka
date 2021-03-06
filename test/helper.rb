require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'fakeweb'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'djatoka'
#require 'ruby-debug'

class Test::Unit::TestCase
  def self.with_a_resolver(&block)
    context 'resolver setup' do
      setup do
        @resolver = Djatoka::Resolver.new('http://african.lanl.gov/adore-djatoka/resolver')
        @identifier = 'info:lanl-repo/ds/5aa182c2-c092-4596-af6e-e95d2e263de3'
        @url_encoded_identifier = 'info%3Alanl-repo%2Fds%2F5aa182c2-c092-4596-af6e-e95d2e263de3'
      end

      merge_block(&block) if block_given?
    end
  end

  def set_testing_curb
    Djatoka.use_curb = false
#    begin
#      require 'curb'
#      Djatoka.use_curb = true
#    rescue LoadError
#      Djatoka.use_curb = false
#    end
  end

end


#curl -is -H 'Accept: application/json'  -d "url_ver=Z39.88-2004&rft_id=ua023_015-006-bx0003-014-075&svc_id=info%3Alanl-repo%2Fsvc%2FgetMetadata" http://scrc.lib.ncsu.edu/adore-djatoka/resolver > test/fixtures/ua023_015-006-bx0003-014-075-metadata.json

FakeWeb.register_uri(:get, "http://african.lanl.gov/adore-djatoka/resolver?rft_id=ua023_015-006-bx0003-014-075&svc_id=info%3Alanl-repo%2Fsvc%2FgetMetadata&url_ver=Z39.88-2004",
  :response => File.read('test/fixtures/ua023_015-006-bx0003-014-075-metadata.json'))
  
FakeWeb.register_uri(:get, "http://african.lanl.gov/adore-djatoka/resolver?rft_id=asdf&svc_id=info%3Alanl-repo%2Fsvc%2FgetMetadata&url_ver=Z39.88-2004",
  :response => File.read('test/fixtures/empty-metadata.json'))
