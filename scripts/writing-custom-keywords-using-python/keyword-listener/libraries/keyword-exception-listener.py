from robot import result
from robot.api import logger
from robot.utils.error import get_error_details


def end_keyword(_, result: result.Keyword):
    if result.status == "FAIL":
        message, traceback = get_error_details(full_traceback=True)

        trace_details = (
            f"keyword failed with error message: {message}\n>>>{traceback}<<<"
        )

        logger.debug(msg=trace_details)
