import pytest
import sys, os

sys.path.insert(0, "/app/")

from datasets import util


def test_app():
    assert 1 == 1


def test_datasets():
    assert "records" in util.load_data()
