import pytest
import sys, os

# currentdir = os.path.dirname(os.path.abspath(inspect.getfile(inspect.currentframe())))
# parentdir = os.path.dirname(currentdir)

sys.path.insert(1, os.path.join(sys.path[0], "../src/"))
# sys.path.insert(0, f"{parentdir}/app/")

from datasets import util


def test_app():
    assert 1 == 1


def test_datasets():
    assert "records" in util.load_data()
