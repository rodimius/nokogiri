require File.expand_path(File.join(File.dirname(__FILE__), '..', "helper"))

module Nokogiri
  module HTML
    class TestBuilder < Nokogiri::TestCase
      def test_attributes_plus_block
        builder = Nokogiri::HTML::Builder.new do
          div.rad.thing! {
            text "awesome"
          }
        end
        puts builder.doc.to_html
      end

      def test_builder_adds_attributes
        builder = Nokogiri::HTML::Builder.new do
          div.rad.thing! "tender div"
        end
        assert_equal('<div class="rad" id="thing">tender div</div>',
                     builder.doc.to_html.chomp)
      end

      def test_bold_tag
        builder = Nokogiri::HTML::Builder.new do
          b "bold tag"
        end
        assert_equal('<b>bold tag</b>', builder.doc.to_html.chomp)
      end

      def test_html_then_body_tag
        builder = Nokogiri::HTML::Builder.new do
          html {
            body {
              b "bold tag"
            }
          }
        end
        assert_equal('<html><body><b>bold tag</b></body></html>',
                     builder.doc.to_html.chomp)
      end
    end
  end
end