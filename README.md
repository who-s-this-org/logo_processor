# Logo Renamer

A CLI tool to automatically rename company logo images based on brand recognition using Gemini or local OpenAI-compatible models, and to manipulate images with operations like trimming and background extension.

## Setup

1.  **Install dependencies:**
    ```bash
    pip install -r requirements.txt
    ```

2.  **Configure environment:**
    Create a `.env` file from the example:
    ```bash
    cp .env.example .env
    ```
    Then add your configuration:
    ```bash
    # For Gemini
    GEMINI_API_KEY=your_key_here
    GEMINI_MODEL_NAME=gemini-2.0-flash-exp

    # For Local (Optional)
    LOCAL_OPENAI_BASE_URL=http://localhost:1234/v1
    LOCAL_OPENAI_API_KEY=lm-studio
    LOCAL_OPENAI_MODEL_NAME=your-local-model
    ```

## Usage

### Rename Command

Identifies a company from its logo and renames the file to the company name (sanitized `snake_case`).

**Rename a single logo:**
```bash
python main.py rename path/to/logo.png
```

**Rename all logos in a directory:**
The renamed files will be moved into a `renamed` subdirectory.
```bash
python main.py rename path/to/logos_dir/
```

**Options:**
- `--provider` (`-p`): AI provider: `gemini` (default) or `local`.
- `--model-name`: Specify a model (defaults to `GEMINI_MODEL_NAME` or `LOCAL_OPENAI_MODEL_NAME`).
- `--dry-run`: Show what would happen without actually renaming or moving files.
- `--max-images` (`-n`): Limit the number of images to process in a directory.

---

### Manipulate Command

Apply a sequence of image operations like background extension and trimming.

**Usage:**
```bash
python main.py manipulate <operations> <path(s)>
```

**Available Operations:**
Operations are passed as a comma-separated string:
- `e`: **Extend** the background (identifies background color from the edges).
- `t<margin>`: **Trim** the image with an optional pixel margin (default is 20).

**Examples:**
- **Trim with 20px margin:**
  ```bash
  python main.py manipulate t20 path/to/logo.png
  ```
- **Extend background then trim with 48px margin:**
  ```bash
  python main.py manipulate e,t48 path/to/logo.png
  ```
- **Just extend:**
  ```bash
  python main.py manipulate e path/to/logos_dir/
  ```

**Options:**
- `--replace` (`-r`): Replace the original file instead of creating a `_processed` version.
- `--no-skip-same`: Save the image even if it's identical to the source.

---

## How it works

### Renaming
It uses either the `google-genai` or `openai` SDK to send the image to a vision-capable model. The model identifies the brand (even if no text is present) and returns a structured response containing a sanitized `snake_case` name, which is then used to rename the file.

### Manipulation
- **Trim:** Automatically identifies the background color from the top-left pixel and removes it, leaving the logo centered with the specified margin.
- **Extend:** Identifies the edge color and pads the image, useful for logos that are too tight to the edges.

## Utility Scripts
The project includes several helper scripts for organization and cleanup:
- `move.sh`: Organizes files into folders (A-Z, 0) by their first letter.
- `rename.sh`: Clean up filenames (removes screenshot prefixes, multiple underscores, etc.).
- `remove_alpha.sh`: Removes transparency (requires ImageMagick).
