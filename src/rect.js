const Segment = require('./segment')


const cls = module.exports = class GridRect
{
    constructor(x, y)
    {
        this.x = x
        this.y = y
    }

    locate(x, y)
    {
        this.x.offset = x
        this.y.offset = y
        return this
    }

    move(dx, dy)
    {
        this.x.offset += dx
        this.y.offset += dy
        return this
    }

    expand(w, h=w)
    {
        this.x.difference = w
        this.y.difference = h
        return this
    }

    inflate(dw, dh=dw)
    {
        this.x.difference += dw
        this.y.difference += dh
        return this
    }

    endAt(x, y)
    {
        this.x.end = x
        this.y.end = y
        return this
    }
}

require('./define-string-tag')(cls, 'GridRect')
