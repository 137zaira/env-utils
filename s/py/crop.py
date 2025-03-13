import sys, os, argparse
from PIL import Image
# . "$_b/envs/sd/bin/activate"
# python "/_/u/s/py/crop.py" -t 64 -r 31 -o /i/s/0_xxx/new_unsorted/short/tumblr_skh4r4kZJ51apbx1r/0_top_out -f 

max_width=545
max_height=960

## WIP
print("WIP")

def dir_path(path):
    if os.path.isdir(path):
        return path
    else:
        # raise argparse.ArgumentTypeError(f"readable_dir:{path} is not a valid path")
        os.makedirs(path)
        return path
def file_path(path):
    if os.path.isfile(path):
        return path
    else:
        raise argparse.ArgumentTypeError(f"readable_dir:{path} is not a valid path")
parser = argparse.ArgumentParser()
parser.add_argument('-f', '--file', dest='file_path', help='Input file path', type=file_path)
parser.add_argument('-o', '--out_dir', dest='out_dir', help='Output dir', type=dir_path)
parser.add_argument('-t', dest='top_cut', help='Crop top flag', action="store_true")
parser.add_argument('-b', dest='bottom_cut', help='Crop bottom flag', action="store_true")
parser.add_argument('-l', dest='left_cut', help='Crop left flag', action="store_true")
parser.add_argument('-r', dest='right_cut', help='Crop right flag', action="store_true")
args = parser.parse_args()
 
def crop_prepare(im):
    width, height = im.size
    # print("w: ", width)
    # print("h: ", height)
    crop_w=width-max_width
    crop_h=height-max_height
    # print("crop_w: ", crop_w)
    # print("crop_h: ", crop_h)

    half_crop_h=crop_h/2
    if args.top_cut:
        if args.bottom_cut:
        # print("__ both __")
            top=half_crop_h
            bottom=height-half_crop_h
        else:
            # print("__ top only __")
            top=crop_h
            bottom=height
    else:
        if args.bottom_cut:
            # print("__ bottom only __")
            top=0
            bottom=height-crop_h
        else:
            # print("__ both __")
            top=half_crop_h
            bottom=height-half_crop_h

    half_crop_w=crop_w/2
    if args.left_cut:
        if args.right_cut:
        # print("__ both __")
            left=half_crop_w
            right=width-half_crop_w
        else:
            # print("__ top only __")
            left=crop_w
            right=width
    else:
        if args.right_cut:
            # print("__ bottom only __")
            left=0
            right=width-crop_w
        else:
            # print("__ both __")
            left=half_crop_w
            right=width-half_crop_w
    return (left, right, top, bottom)


file_name=os.path.basename(args.file_path)
# print("file_name:", file_name)
def crop(args):
    im = Image.open(args.file_path)
    (left, right, top, bottom) = crop_prepare(im)
    # print("L:R=", left, ":", right, "|&| width:", right-left)
    # print("T:B=", top, ":", bottom, "|&| height:", bottom-top)
    
    im1 = im.crop((left, top, right, bottom))
    # Shows the image in image viewer
    # im1.show()
    im1.save(f"{args.out_dir}/{file_name}")

crop(args)