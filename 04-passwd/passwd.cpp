#include <algorithm>
#include <numeric>
#include <array>
#include <stdio.h>
#include <cassert>

using Passwd = std::array<int, 6>;

// 347312-805915
const Passwd first = {3, 4, 7, 3, 1, 2};
const Passwd last = {8, 0, 5, 9, 1, 5};

void print(Passwd p)
{
    fprintf(stdout, "(%i,%i,%i,%i,%i,%i)\n", p[0], p[1], p[2], p[3], p[4], p[5]);
}

bool has_double(const Passwd& p)
{
    return std::adjacent_find(std::begin(p), std::end(p)) != std::end(p);
}

bool is_not_decreasing(const Passwd& p)
{
    return std::adjacent_find(p.begin(), p.end(), [](int lval, int rval)
        {
            return lval > rval;
        }) == p.end();
}

bool is_valid_passwd(const Passwd& p)
{
    return (has_double(p) and is_not_decreasing(p));
}

void inc(Passwd& p, int i)
{
    if (i < 0)
    {
        return;
    }
    p[i]++;
    if (p[i] > 9)
    {
        p[i] = 0;
        inc(p, i - 1);
    }
}

Passwd normalise(const Passwd& p)
{
    Passwd ret(p);
    for (auto i = 1; i < ret.size(); ++i)
    {
        ret[i] = std::max(ret[i], ret[i - 1]);
    }
    return ret;
}

Passwd next_passwd(const Passwd& p)
{
    Passwd ret = p;
    inc(ret, 5);
    return normalise(ret);
}

void ut()
{
    assert(is_valid_passwd({1, 1, 1, 1, 1, 1}));
    assert(not is_valid_passwd({2, 2, 3, 4, 5, 0}));
    assert(not is_valid_passwd({1, 2, 3, 7, 8, 9}));

    assert(has_double({1, 1, 1, 1, 1, 1}));
    assert(has_double({1, 2, 3, 3, 2, 1}));
    assert(not has_double({1, 2, 1, 2, 1, 2}));

    assert((normalise({1, 1, 1, 1, 1, 1}) == Passwd{1, 1, 1, 1, 1, 1}));
    assert((normalise({1, 2, 1, 1, 1, 3}) == Passwd{1, 2, 2, 2, 2, 3}));
    assert((normalise({3, 1, 2, 7, 1, 9}) == Passwd{3, 3, 3, 7, 7, 9}));

    assert((next_passwd({1, 1, 1, 1, 1, 1}) == Passwd{1, 1, 1, 1, 1, 2}));
    assert((next_passwd({2, 2, 2, 2, 2, 9}) == Passwd{2, 2, 2, 2, 3, 3}));
}

int main()
{
    ut();
    for (auto p = first; p < last; p = next_passwd(p)) {
        if (is_valid_passwd(p))
        {
            print(p);
        }
    }
}
