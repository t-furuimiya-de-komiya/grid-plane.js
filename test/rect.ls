require! './test.ls': {expect, Plane}


suite \GridRect

before ->
    @plane = new Plane 12

before-each ->
    @rect = @plane.at 0, 0

test 'x and y is GridSegment' ->
    expect @rect.x .to.be.a \GridSegment
    expect @rect.y .to.be.a \GridSegment

test \#locate ->
    expect @rect.locate 15, 10
    .to.equal @rect
    .and.eql @plane.at 15, 10

test \#move ->
    @rect.locate 10, 15
    expect @rect.move 5, -5
    .to.equal @rect
    .and.eql @plane.at 15, 10

test \#expand ->
    expect @rect.expand 30, 20
    .to.equal @rect
    .and.eql @plane.at 0, 0, 30, 20

test \#inflate ->
    @rect.expand 20, 30
    expect @rect.inflate 10, -10
    .to.equal @rect
    .and.eql @plane.at 0, 0, 30, 20

test \#endAt ->
    @rect.locate 10, 10
    expect @rect.end-at -20, 30
    .to.equal @rect
    .and.eql @plane.at 10, 10, -30, 20
