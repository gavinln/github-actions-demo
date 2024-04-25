from github_actions_demo import numpy_op


def test_sum_int():
    values = list(range(10))
    assert numpy_op.sum(values) == sum(values)


def test_sum_float():
    values = list(range(10))
    values = [value * 0.3 for value in values]
    assert numpy_op.sum(values) == sum(values)
