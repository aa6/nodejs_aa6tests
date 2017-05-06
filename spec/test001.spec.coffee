[ coffee ] = [ (require "coffee-script") ]

describe "Reality", ->

  it "restlessly trying to change the rules", ->

    try
      coffee.eval(
        """
        arr = []
        arr.push(
        {
        })
        """
      )
    catch err
      errmessage1 = err.message

    expect(errmessage1).toBe('unexpected newline')