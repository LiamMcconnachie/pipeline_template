"""Some example spark functions"""

from pyspark.sql import (
    functions as F,
    Window
)

from typing import Optional, Sequence, Union

def get_window_spec(
    partition_cols: Optional[Union[str, Sequence[str]]] = None,
    order_cols: Optional[Union[str, Sequence[str]]] = None):
    """get window spec"""
    window_spec = (
        Window
        .partitionBy(partition_cols)
        .orderBy(order_cols)
    )
    return window_spec