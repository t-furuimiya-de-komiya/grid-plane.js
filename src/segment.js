

const cls = module.exports = class GridSegment
{
    constructor(axis, offset=0, difference=0)
    {
        this.axis = axis
        this.offset = offset
        this.difference = difference
    }

    get end()
    {
        return this.offset + this.difference
    }

    set end(val)
    {
        this.difference = val - this.offset
    }

    get minIndex()
    {
        const val = Math.min(this.offset, this.end)
        return Math.floor(val / this.axis.step)
    }

    get maxIndex()
    {
        const val = Math.max(this.offset, this.end)
        return Math.floor(val / this.axis.step) + 1
    }

    get min()
    {
        return this.minIndex * this.axis.step
    }

    get max()
    {
        return this.maxIndex * this.axis.step
    }

    get center()
    {
        return 0.5 * (this.min + this.max)
    }

    get count()
    {
        return this.maxIndex - this.minIndex
    }

    get length()
    {
        return this.count * this.axis.step
    }

    *stops()
    {
        for (let index of this.indices())
            yield {index, offset: index * this.axis.step}
    }

    *indices()
    {
        const {minIndex, maxIndex} = this
        for (let i = minIndex; i <= maxIndex; ++i)
            yield i
    }

    toJSON()
    {
        const {offset, difference} = this
        return {offset, difference}
    }

}

require('./define-string-tag')(cls, 'GridSegment')
