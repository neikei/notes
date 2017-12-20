### 2017-10-15: Ubuntu optimize jpeg images

The jpegoptim tool optimizes jpg images and compresses them without loss of quality.

```bash
#: Install jpegoptim
sudo apt install jpegoptim

#: Optimize a single image. Caution: this will overwrite the original image.
jpegoptim ./pictures/testimage.jpg
./Pictures/testimage.jpg 3120x4160 24bit N Exif  [OK] 841351 --> 729471 bytes (13.30%), optimized.

#: Optimize a single file and store it in a different directory to keep the original image.
jpegoptim ./pictures/testimage.jpg --dest="/tmp/"
./Pictures/testimage.jpg 3120x4160 24bit N Exif  [OK] 841351 --> 729471 bytes (13.30%), optimized.

#: Optimize images of a find result
find . -type f -regextype posix-extended -regex "^.*\.(jpg|jpeg|JPG|JPEG)$" -exec jpegoptim {} \;
./Pictures/testimage1.jpg 3120x4160 24bit N Exif  [OK] 841351 --> 729471 bytes (13.30%), optimized.
./Pictures/testimage2.jpg 3120x4160 24bit N Exif  [OK] 841351 --> 729471 bytes (13.30%), optimized.
```
