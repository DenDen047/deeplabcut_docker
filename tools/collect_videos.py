import os, sys
import re
import glob
from pprint import pprint


DATA_ROOT_DIR = '/home/naoya/Documents/AcinoSet'
TARGET_DIR = '/home/naoya/Documents/dlc_videos'
VIDEO_DIR_PATH_FILE = 'video_paths.txt'  # contain relative video-dir paths


if __name__ == '__main__':
    # load video paths
    with open(VIDEO_DIR_PATH_FILE, 'r') as f:
        dir_paths = f.readlines()

    src_paths = []
    dst_paths = []
    for d in dir_paths:
        d = re.sub('\s+',' ', d).strip()
        dir_path = os.path.join(DATA_ROOT_DIR, d)
        vid_paths = glob.glob(os.path.join(dir_path, '*.mp4'))
        src_paths += vid_paths
        dst_paths += [os.path.join(TARGET_DIR, '{}-{}'.format(d.replace('/', '-'), os.path.basename(p))) for p in vid_paths]
    pprint(src_paths)

    # make the symbolic links
    for src, dst in zip(src_paths, dst_paths):
        os.symlink(src, dst)