[ coffee ] = [ (require "coffee-script") ]

describe "CoffeeScript destructuring assignments", ->

  it "can have mismatching arguments for an array form", ->

    [ foo, bar, baz ] = [ "foo", "bar" ]

    expect(foo).toBe("foo")
    expect(bar).toBe("bar")
    expect(baz).not.toBeDefined()