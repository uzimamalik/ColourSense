from flask import Flask, jsonify
import cv2
import numpy as np
import sys

image_path = sys.argv[1]

app = Flask(__name__)


@app.route('/')
def detect_colour():
    # Load the image, convert to grayscale
    img = cv2.imread('/Users/uzimamalik/Desktop/green.jpg')
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

    # Apply Otsu's thresholding to get a binary image
    blur = cv2.GaussianBlur(img,(5,5),0)
    _, binary = cv2.threshold(gray, 0, 255, cv2.THRESH_BINARY_INV+cv2.THRESH_OTSU)

    # Find contours in the binary image
    contours, hierarchy = cv2.findContours(binary, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)

    # Choose the contour taking up the largest area
    largest_contour = max(contours, key=cv2.contourArea)

    # Create a mask
    mask = cv2.drawContours(np.zeros_like(binary), [largest_contour], 0, (255, 255, 255), -1)

    # Compute the average colour of the piece of clothing
    average_colour = cv2.mean(img, mask=mask)[:3]

    average_colour = average_colour[::-1]

    average_colour_dict = {
        "red": average_colour[0],
        "green": average_colour[1],
        "blue": average_colour[2]
    }

    return jsonify(average_colour)

if __name__ == '__main__':
    app.run()
