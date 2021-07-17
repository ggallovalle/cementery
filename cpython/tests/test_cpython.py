from cpython import __version__


def test_version():
    assert __version__ == '0.1.0'

def test_same_object():
    class A:
        pass
    a = A()
    a2 = A()

    assert 1 is 1
    assert 1 is not 2
    assert A is A
    assert a is a
    assert a is not a2


def test_same_type():
    class B:
        pass
    class A:
        pass
    a = A()
    b = B()
    assert type(a) == A
    assert type(b) == B
    assert type(b) != bool
    assert type(True) == bool
    assert type(10.5) == float
    assert type(10) == int
