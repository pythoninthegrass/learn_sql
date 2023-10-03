#!/usr/bin/env python3

from hypothesis import given, strategies as st
from ..bin import import_data

# TODO: fix relative import ./bin/import_data.py

# TODO: replace st.nothing() with an appropriate strategy

@given(filename=st.nothing())
def test_fuzz_read_csv(filename):
    import_data.read_csv(filename=filename)
