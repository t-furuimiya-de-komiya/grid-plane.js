require! './test.ls': {expect, Axis}


suite \GridAxis

before ->
    @axis = new Axis 12

test \#at ->
    expect @axis.at 20
    .to.be.a \GridSegment
    .that.includes {
        offset: 20
        difference: 0
        end: 20
        min-index: 1
        max-index: 2
        min: 12
        max: 24
        center: 18
        count: 1
        length: 12
    }
    expect @axis.at -20 .to.include {
        offset: -20
        difference: 0
        end: -20
        min-index: -2
        max-index: -1
        min: -24
        max: -12
        center: -18
        count: 1
        length: 12
    }
    expect @axis.at 10, 10 .to.include {
        offset: 10
        difference: 10
        end: 20
        min-index: 0
        max-index: 2
        min: 0
        max: 24
        center: 12
        count: 2
        length: 24
    }
    expect @axis.at 10, -10 .to.include {
        offset: 10
        difference: -10
        end: 0
        min-index: 0
        max-index: 1
        count: 1
        length: 12
    }
    expect @axis.at -10, 10 .to.include {
        offset: -10
        difference: 10
        end: 0
        min-index: -1
        max-index: 1
        min: -12
        max: 12
        count: 2
        length: 24
    }
    expect @axis.at -10, -10 .to.include {
        offset: -10
        difference: -10
        end: -20
        min-index: -2
        max-index: 0
        min: -24
        max: 0
        center: -12
        count: 2
        length: 24
    }

test \#cell ->
    expect @axis.cell 1
    .to.eql @axis.at 12
    expect @axis.cell 1, 2
    .to.eql @axis.at 12, 24
