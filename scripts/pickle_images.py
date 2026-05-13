"""
Image Pickling Helper
=====================

Reads every image in a folder and serializes the list into a single pickle file.
Useful for batching a training/dataset folder into one easily-loadable artifact.

Usage:
    Edit IMAGE_FOLDER and OUTPUT_FILE below, then run:
        python scripts/pickle_images.py
"""

import os
import pickle

import cv2

# ============================================================
# Configuration — adjust these for your dataset
# ============================================================
IMAGE_FOLDER = "static/dataset/ENCrimeNet"
OUTPUT_FILE = "static/dataset/ENCrimeNet.pkl"

SUPPORTED_EXTENSIONS = (".png", ".jpg", ".jpeg", ".bmp", ".gif")


def pickle_image_folder(image_folder: str, output_file: str) -> int:
    """Read every supported image in `image_folder` and pickle the list to `output_file`.

    Returns the number of images written.
    """
    images = []

    for filename in os.listdir(image_folder):
        if filename.lower().endswith(SUPPORTED_EXTENSIONS):
            img_path = os.path.join(image_folder, filename)
            img = cv2.imread(img_path)
            if img is not None:
                images.append(img)

    output_dir = os.path.dirname(output_file)
    if output_dir:
        os.makedirs(output_dir, exist_ok=True)

    with open(output_file, "wb") as f:
        pickle.dump(images, f)

    return len(images)


if __name__ == "__main__":
    count = pickle_image_folder(IMAGE_FOLDER, OUTPUT_FILE)
    print(f"Pickled {count} image(s) from '{IMAGE_FOLDER}' to '{OUTPUT_FILE}'.")
