import sys, os, argparse, math
from PIL import Image
# . "$_b/envs/sd/bin/activate"
# python "/_/u/s/py/scale.py" -x 3840 -y 1600 -o /i/s/images/orig_up1_stage -f 
# python "/_/u/s/py/scale.py" -x 3840 -y 3200 -o /i/s/images/orig_up1_stage2 -f 
# python "/_/u/s/py/scale.py" -x 3840 -y 1600 -o /i/s/images/orig_up1_stage1600 -f
# 3840/1600 = 2.4 _ w/h . w/h * 2084(w) = 5001.6
# 1600/3840 = .41666666667 _ h/w . h/w * 2084(w) = 5001.6

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
parser.add_argument('-x', dest='width_target', help='Maximum width', type=int)
parser.add_argument('-y', dest='height_target', help='Maximum height', type=int)

# parser.add_argument('-t', dest='top_cut', help='Crop top flag', action="store_true")
# parser.add_argument('-b', dest='bottom_cut', help='Crop bottom flag', action="store_true")
# parser.add_argument('-l', dest='left_cut', help='Crop left flag', action="store_true")
# parser.add_argument('-r', dest='right_cut', help='Crop right flag', action="store_true")
args = parser.parse_args()

im = Image.open(args.file_path)
width, height = im.size
width_target = args.width_target
height_target = args.height_target

def get_ratio():
    if width > width_target or height > height_target:
        return (1, 1)
    optimal_ratio = args.width_target/args.height_target
    actual_ratio = width/height
    # print("optimal_ratio: ", optimal_ratio)
    # print("actual_ratio: ", actual_ratio)
    
    # height is the limiting dimension when 
    if optimal_ratio > actual_ratio:
        half_target_height = args.height_target/2
        if height > half_target_height:
            return (half_target_height/height, .5)
        quarter_target_height = args.height_target/4
        if height > quarter_target_height:
            return (quarter_target_height/height, .25)
        return (1, .25)
    # else width limits scale size
    else:
        half_target_width = args.width_target/2
        if width > half_target_width:
            return (half_target_width/width, .5)
        quarter_target_width = args.width_target/4
        if width > quarter_target_width:
            return (quarter_target_width/width, .25)
        return (1, .25)
    
ratio, multiplier = get_ratio()
# print("get_ratio ratio:", ratio)
# print("get_ratio multiplier:", multiplier)
new_width = math.floor(ratio*width+.5)
new_height = math.floor(ratio*height+.5)

file_name = os.path.basename(args.file_path)
print("file_name  :", file_name)
print("orig width :", width)
print("orig height:", height)
print("new_width  :", new_width)
print("new_height :", new_height)
out_dir = args.out_dir
if multiplier == 1:
    dir_path=os.path.join(out_dir, "no_upscale")
    if not os.path.isdir(dir_path):
        os.makedirs(dir_path)
    copy_path = os.path.join(dir_path, file_name)
    im.save(copy_path)
elif multiplier == .5:
    dir_path=os.path.join(out_dir, "2x")
    if not os.path.isdir(dir_path):
        os.makedirs(dir_path)
    new_path = os.path.join(dir_path, file_name)
    resized_image = im.resize((int(width*ratio+.5), int(height*ratio+.5)))
    resized_image.save(new_path)
else:    
    dir_path=os.path.join(out_dir, "4x")
    if not os.path.isdir(dir_path):
        os.makedirs(dir_path)
    new_path = os.path.join(dir_path, file_name)
    resized_image = im.resize((int(width*ratio+.5), int(height*ratio+.5)))
    resized_image.save(new_path)

# resized_image = im.resize((new_width, new_height))