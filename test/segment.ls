require! './test.ls': {expect, Axis}


suite \GridSegment

before ->
    @axis = new Axis 12

test 'update offset' ->
    p = @axis.at 10
    p.offset = 30
    expect p .to.include {
        offset: 30
        difference: 0
        end: 30
        min-index: 2
        max-index: 3
        count: 1
        length: 12
    }
    p.offset = -30
    expect p .to.include {
        offset: -30
        difference: 0
        end: -30
        min-index: -3
        max-index: -2
        count: 1
    }

test 'update diff' ->
    p = @axis.at 10
    p.difference = 20
    expect p .to.include {
        offset: 10
        difference: 20
        end: 30
        min-index: 0
        max-index: 3
        count: 3
    }
    p.difference = -20
    expect p .to.include {
        offset: 10
        difference: -20
        end: -10
        min-index: -1
        max-index: 1
        count: 2
    }

test 'update end' ->
    p = @axis.at 10
    p.end = -10
    expect p .to.include {
        offset: 10
        difference: -20
        end: -10
        min-index: -1
        max-index: 1
        count: 2
    }

test '#indices' ->
    p = @axis.at -10, 20
    expect Array.from p.indices!
    .to.eql [-1, 0, 1]

test '#stops' ->
    p = @axis.at -10, 20
    expect Array.from p.stops!
    .to.eql [-12, 0, 12]
