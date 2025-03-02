import cv2

I= cv2.imread('track_bw_scaled.png')

# cv2.imshow('original image',I)
# cv2.waitKey(0)

# sobelx = cv2.Sobel(src=I, ddepth=cv2.CV_64F, dx=1, dy=1, ksize=1)
# cv2.imshow('sobelx', sobelx)

# Canny Edge Detection
I_gray=cv2.cvtColor(I, cv2.COLOR_BGR2GRAY)
edges = cv2.Canny(image=I_gray, threshold1=100, threshold2=200) # Canny Edge Detection
# Display Canny Edge Detection Image
cv2.imshow('Canny Edge Detection', edges)
cv2.waitKey(0)

nI=~edges


# import pdb
# pdb.set_trace()


cv2.imshow('Canny Edge Detection', nI)

cv2.waitKey(0)

cv2.imwrite('track_bw_scaled_inverted.png', nI)