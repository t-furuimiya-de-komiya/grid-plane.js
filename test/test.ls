require! <[chai chai-as-promised]>

chai.use chai-as-promised
require! chai

export chai.expect
export Axis = require('../src/axis')
export Plane = require('..')

export function delay t
    new Promise (|> set-timeout(_, t))
