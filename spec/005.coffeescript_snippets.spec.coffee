[] = []
####################################################################################################
describe "CoffeeScript snippets", ->
####################################################################################################
####################################################################################################
  it "is possible to break cycle from within a oneliner", ->

    ################################################################################################


    fn1 = (list) ->
      for item in list 
        unless (current = item)? then current = "error"; break
      return current

    result1 = fn1([ 1, 2, 3, 4, 5, 6])
    result2 = fn1([ 1, 2, 3, undefined, 5, 6])

    expect(result1).toBe(6)
    expect(result2).toBe("error")


    fn2 = (list) ->
      break for item in list when (current = item ? 'error') is 'error'
      return current

    result3 = fn2([ 1, 2, 3, 4, 5, 6])
    result4 = fn2([ 1, 2, 3, undefined, 5, 6])

    expect(result3).toBe(6)
    expect(result4).toBe("error")


    ################################################################################################

####################################################################################################
####################################################################################################
  it "code block most likely could be folded into a oneliner", ->

    ################################################################################################


    fn = (list) ->
      (unless (current = item)? then current = "error"; break) for item in list 
      return current

    result1 = fn([ 1, 2, 3, 4, 5, 6])
    result2 = fn([ 1, 2, 3, undefined, 5, 6])

    expect(result1).toBe(6)
    expect(result2).toBe("error")


    ################################################################################################
