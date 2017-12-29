
module.exports = function defineStringTag(cls, value)
{
    Object.defineProperty(cls.prototype, Symbol.toStringTag, {value})
}
