[ fs, path ] = [ (require 'fs-extra'),(require 'path') ]
testfile = (datadir = "data/" + path.parse(__filename).name) + "/" + "test.txt"

describe "Truncating by file descriptor (fs.ftruncateSync)", ->

  beforeAll ->
    fs.ensureDirSync(datadir)

  afterAll ->
    fs.removeSync(datadir)

  beforeEach ->
    fs.writeFileSync(testfile,"0123456789abcdef")

  it "throws EINVAL when opened in read-only mode", ->

    fd = fs.openSync(testfile,"r")
    try
      fs.ftruncateSync(fd,0)
    catch err
      errcode = err.code
    fs.close(fd)

    expect(errcode).toBeDefined()
    expect(errcode).toBe("EINVAL")

  it "works without errors when opened in append mode", ->

    fd = fs.openSync(testfile,"a")
    try
      fs.ftruncateSync(fd,3)
      filecontents = fs.readFileSync(testfile).toString()
    catch err
      errcode = err.code
    fs.close(fd)

    expect(errcode).not.toBeDefined()
    expect(filecontents).toBe("012")

  it "works without errors when opened in write mode", ->

    fd = fs.openSync(testfile,"w")
    try
      fs.ftruncateSync(fd,2)
      filecontents = fs.readFileSync(testfile).toString()
    catch err
      errcode = err.code
    fs.close(fd)

    expect(errcode).not.toBeDefined()
    expect(filecontents.length).toBe(2)
    expect(filecontents).toBe("\u0000\u0000") # Generates bogus error message "Expected '' to be ''".

  it "doesn't care about simultaneously opened read-only file descriptors", ->

    fd1 = fs.openSync(testfile,"r")
    fd2 = fs.openSync(testfile,"a")
    try
      fs.ftruncateSync(fd2,5)
      filecontents = fs.readFileSync(testfile).toString()
    catch err
      errcode = err.code
    fs.close(fd1)
    fs.close(fd2)

    expect(errcode).not.toBeDefined()
    expect(filecontents).toBe("01234")