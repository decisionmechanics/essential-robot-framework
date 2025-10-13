import requests
from robot.api.deco import keyword
from robot.utils.asserts import assert_true


@keyword("Page Should Contain Title")
def page_should_contain_title(url: str, expected_title: str):
    """Fetch a webpage and verify its HTML contains the expected title."""
    response = requests.get(url, timeout=10)

    assert_true(response.ok, f"Failed to fetch page: {url}")

    assert_true(
        f"<title>{expected_title}</title>" in response.text,
        f"Expected title '{expected_title}' not found in page.",
    )
