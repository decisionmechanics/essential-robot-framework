import time
from robot.api.deco import keyword
from robot.api import logger
from robot.libraries.BuiltIn import BuiltIn


@keyword("Measure Execution Time")
def measure_execution_time(keyword_name: str, *args):
    """Run another keyword and log how long it takes."""
    built_in = BuiltIn()

    start = time.perf_counter()
    built_in.run_keyword(keyword_name, *args)
    elapsed = time.perf_counter() - start

    logger.info(f"Keyword '{keyword_name}' took {elapsed:.3f} seconds to execute.")

    return elapsed
