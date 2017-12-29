const GridAxis = require('./axis')
const GridRect = require('./rect')


module.exports = class GridPlane
{
    constructor(w=1, h=w)
    {
        this.x = new GridAxis(w)
        this.y = new GridAxis(h)
    }

    at(x, y, w=0, h=w)
    {
        return new GridRect(this.x.at(x, w), this.y.at(y, h))
    }

    rect(w, h=w)
    {
        return this.at(0, 0, w, h)
    }

    grid(i, j, m=1, n=m)
    {
        return new GridRect(this.x.grid(i, m), this.y.grid(j, n))
    }

}
