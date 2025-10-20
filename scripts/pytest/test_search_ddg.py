# Run this as headed, or DuckDuckGo might think it's a bot

from playwright.sync_api import Page, expect
import re


def test_duckduckgo_robotframework(page: Page):
    page.goto("https://duckduckgo.com")

    page.get_by_placeholder("Search without being tracked").fill("Robot Framework")
    page.keyboard.press("Enter")

    results = page.locator("section[data-testid='mainline']")
    expect(results).to_be_visible()

    expect(page).to_have_title(re.compile("Robot Framework"))
