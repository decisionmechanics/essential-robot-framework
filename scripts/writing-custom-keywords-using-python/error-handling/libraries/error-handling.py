from robot.api.deco import keyword


class RobotFrameworkLibraryException(Exception):
    pass


def throw_exception():
    raise RobotFrameworkLibraryException("Something very, very bad happened!")


def function_d():
    throw_exception()


def function_c():
    function_d()


def function_b():
    function_c()


def function_a():
    function_b()


@keyword(name="Do Stuff")
def do_stuff():
    function_a()
