import requests

BASE_URL = "https://api.github.com"
REPO = "robotframework/robotframework"


def test_get_repo_details():
    response = requests.get(f"{BASE_URL}/repos/{REPO}")
    assert response.status_code == 200

    data = response.json()
    assert data["name"] == "robotframework"
    assert data["owner"]["login"] == "robotframework"
    assert data["private"] is False
    assert "stargazers_count" in data
    assert "forks_count" in data


def test_list_issues():
    response = requests.get(f"{BASE_URL}/repos/{REPO}/issues", params={"state": "open"})
    assert response.status_code == 200

    issues = response.json()
    assert isinstance(issues, list)
    if issues:
        assert "title" in issues[0]
        assert "html_url" in issues[0]
        assert "user" in issues[0]


def test_contributors():
    response = requests.get(f"{BASE_URL}/repos/{REPO}/contributors")
    assert response.status_code == 200

    contributors = response.json()
    assert isinstance(contributors, list)
    assert any(c["login"] == "pekkaklarck" in c["login"].lower() for c in contributors)
