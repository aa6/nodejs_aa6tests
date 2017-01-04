[ nodeurl ] = [ (require "url") ]
####################################################################################################
describe "Making url absolute using built-in url module", ->
####################################################################################################
####################################################################################################
  it "works as expected", ->

    ################################################################################################

    for item in ([
      {
        base_url: "http://test.domain.com/pages/3.html"
        relative_url: "/about.html"
        expected_result: "http://test.domain.com/about.html"
      }
      {
        base_url: "http://test.domain.com/pages/3.html"
        relative_url: "about.html"
        expected_result: "http://test.domain.com/pages/about.html"
      }
      {
        base_url: "http://test.domain.com/pages/3.html"
        relative_url: "http://another.domain.com/about.html"
        expected_result: "http://another.domain.com/about.html"
      }
    ])
      expect(
        nodeurl.resolve(item.base_url, item.relative_url)
      ).toBe(
        item.expected_result
      )

    ################################################################################################