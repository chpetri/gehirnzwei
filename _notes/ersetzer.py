import re

def replace_brackets(text):
    def replacer(match):
        original = match.group(1)
        modified = original.replace(" ", "_")
        return f"[[{modified} | {original}]]"

    return re.sub(r'\[\[(.*?)\]\]', replacer, text)

if __name__ == "__main__":
    with open("_notes/comptia220-1102.md", "r") as f:
        content = f.read()

    new_content = replace_brackets(content)

    with open("_notes/comptia220-1102.md", "w") as f:
        f.write(new_content)
