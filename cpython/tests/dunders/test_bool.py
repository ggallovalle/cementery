from cpython.dunders.bool import Person

def test_bool_dunder():
    a = Person()
    b = Person("2020")
    assert not a
    assert b
