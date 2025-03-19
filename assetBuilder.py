import os

# Path to your assets directory
assets_dir = 'data/map/'

# Open pubspec.yaml in write mode (overwrite it)
with open('pubspec.yaml', 'a') as f:
    # Write the asset section if it doesn't already exist
    f.write("\nflutter:\n  uses-material-design: true\n  assets:\n")

    # Walk through the directory and add each SVG file
    for root, dirs, files in os.walk(assets_dir):
        for file in files:
            # Only look for files ending with .svg
            if file.endswith('vector.svg'):
                # Construct the full asset path (using forward slashes)
                asset_path = os.path.join(root, file).replace("\\", "/")
                
                # Write the asset path to pubspec.yaml (indent properly)
                f.write(f"    - {asset_path}\n")

print("Asset paths added to pubspec.yaml")
