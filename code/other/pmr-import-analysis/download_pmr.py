import urllib.request
import re
from pathlib import Path
import subprocess
import os
import sys

if __name__ == "__main__":
    outdir = Path(__file__).parent / "data"
    outdir.mkdir(exist_ok=True)
    os.chdir(outdir)

    with urllib.request.urlopen("https://models.physiomeproject.org/exposure/listing/full-list") as u:
        text = u.read().decode("utf-8")
        lst = re.findall(r'href="(.*?)" class="contenttype-exposure', text)

    # go through all exposures and download projects using git
    for exp in lst:
        with urllib.request.urlopen(exp) as u:
            text = u.read().decode("utf-8")
        print(exp)
        repo = re.search(r'git clone (.*?)["]', text).group(1)
        subprocess.run(["git", "clone"] + repo.split())
