const Segment = require('./segment')


module.exports = class GridAxis
{
    constructor(step)
    {
        this.step = step
    }

    at(offset, length)
    {
        return new Segment(this, offset, length)
    }

    cell(index=0, size=0)
    {
        return new Segment(this, index * this.step, size * this.step)
    }
}
