from github_actions_demo import numpy_op


def test_sum_int():
    values = list(range(10))
    assert numpy_op.sum(values) == sum(values)
    assert False
