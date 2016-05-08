describe "CoffeeScript named arguments", ->

  it "exist and work", ->

    fn1 = ({foo,bar}) ->
      return foo + bar

    fn2 = (foo,{bar,baz}) ->
      return foo + bar + baz

    expect(fn1(foo:"foo",bar:"bar")).toBe("foobar")
    expect(fn2("foo",bar:"bar",baz:"baz")).toBe("foobarbaz")
    expect(
      fn2(
        "foo",
        bar:"bar",
        baz:"baz"
      )
    ).toBe("foobarbaz")