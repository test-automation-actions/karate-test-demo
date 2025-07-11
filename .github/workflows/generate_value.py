"""
generate_value.py
Creates a runtime value and publishes it to GitHub Actions so that:
• it is **masked** in the logs
• it becomes a **step output** called `my_value`
"""

import os, secrets

# 1️⃣ Generate whatever value you need
runtime_value = 25   # <-- your logic here

# 2️⃣ Mask it so it never appears in clear text
print(f"::add-mask::{runtime_value}", flush=True)

# 3️⃣ Write it to the special file pointed to by $GITHUB_OUTPUT
#    This sets the step output named `my_value`
with open(os.environ["GITHUB_OUTPUT"], "a") as fh:
    fh.write(f"my_value={runtime_value}\n")
