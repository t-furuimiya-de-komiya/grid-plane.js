require! './test.ls': {expect, Plane}


suite \GridPlane

before ->
    @plane = new Plane 12, 12

test \#at ->
    expect @plane.at 40, 30
    .to.be.a \GridRect
    .and.nested.include {
        'x.minIndex': 3, 'y.minIndex': 2
        'x.maxIndex': 4, 'y.maxIndex': 3
    }

test '#at with size' ->
    expect @plane.at 40, 30, 20
    .to.nested.include {
        'x.minIndex': 3, 'y.minIndex': 2
        'x.maxIndex': 5, 'y.maxIndex': 5
    }

test '#at with w/h' ->
    expect @plane.at 40, 30, 20, 10
    .to.nested.include {
        'x.minIndex': 3, 'y.minIndex': 2
        'x.maxIndex': 5, 'y.maxIndex': 4
    }

test \#rect ->
    expect @plane.rect 10
    .to.eql @plane.at 0, 0, 10, 10
    expect @plane.rect 10, 20
    .to.eql @plane.at 0, 0, 10, 20

test \#grid ->
    expect @plane.grid 1, 2
    .to.eql @plane.at 12, 24, 12, 12
    expect @plane.grid 1, 2, 3
    .to.eql @plane.at 12, 24, 36, 36
    expect @plane.grid 4, 3, 2, 1
    .to.eql @plane.at 48, 36, 24, 12
