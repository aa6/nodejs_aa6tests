describe "CoffeeScript named arguments", ->

  it "exist and work", ->

    fn1 = ({foo,bar}) ->
      return foo + bar

    fn2 = (foo,{bar,baz}) ->
      return foo + bar + baz

    fn3 = (foo,{bar,baz},qux) ->
      return foo + bar + baz + qux

    expect(fn1(foo:"foo",bar:"bar")).toBe("foobar")
    expect(
      fn1(
        foo:"foo",
        bar:"bar"
      )
    ).toBe("foobar")

    expect(fn2("foo",bar:"bar",baz:"baz")).toBe("foobarbaz")
    expect(
      fn2(
        "foo",
        bar:"bar",
        baz:"baz"
      )
    ).toBe("foobarbaz")

    expect(fn3("foo",bar:"bar",baz:"baz","qux")).toBe("foobarbazqux")
    expect(
      fn3(
        "foo",
        bar:"bar",
        baz:"baz",
        "qux"
      )
    ).toBe("foobarbazqux")